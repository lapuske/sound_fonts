import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';

Builder builder(BuilderOptions options) {
  return SharedPartBuilder([ColorsGenerator()], 'colors');
}

class ColorsGenerator extends GeneratorForAnnotation<SoundColors> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final String prefix = annotation.peek('prefix')?.stringValue ?? '';
    final Set<String> colors = {};
    final Map<String, List<_ColorWithOpacity>> opacities = {};

    final raw = annotation.read('colors').setValue;
    for (var e in raw) {
      final string = e.toStringValue();
      if (string != null) {
        final anyNumbers = String.fromCharCodes(
          string.codeUnits.where((e) => e >= 48 && e <= 57),
        );

        final parsedNumber = int.tryParse(anyNumbers);

        if (parsedNumber != null && string.endsWith('$parsedNumber')) {
          final stringWo =
              string.substring(0, string.length - '$parsedNumber'.length);
          final existing = opacities[stringWo];
          if (existing != null) {
            existing.add(_ColorWithOpacity(string, parsedNumber));
          } else {
            opacities[stringWo] = [_ColorWithOpacity(string, parsedNumber)];
          }
        } else {
          colors.add(string);
        }
      }
    }

    final StringBuffer buffer = StringBuffer();

    final String className = '${prefix}Palette';
    buffer.writeln('class $className {');

    // Constructor.
    buffer.writeln('$className({');
    for (var color in colors) {
      buffer.writeln('required this.$color,');
    }
    for (var colors in opacities.values) {
      for (var e in colors) {
        buffer.writeln('Color? ${e.original},');
      }
    }
    buffer.write('})');

    if (opacities.isNotEmpty) {
      final List<String> assignments = [];

      buffer.writeln(' :');
      for (int i = 0; i < opacities.entries.length; ++i) {
        final entry = opacities.entries.elementAt(i);

        for (int j = 0; j < entry.value.length; ++j) {
          final color = entry.value[j];

          assignments.add(
            '${color.original} = ${color.original} ?? ${entry.key}.withValues(alpha: ${color.opacity / 100})',
          );
        }
      }

      buffer.writeln(assignments.join(',\n'));
    }

    buffer.writeln(';');
    buffer.writeln('');

    // Values.
    for (var color in colors) {
      buffer.writeln('final Color $color;');
    }
    for (var colors in opacities.values) {
      for (var e in colors) {
        buffer.writeln('final Color ${e.original};');
      }
    }

    // Lerp.
    buffer.writeln('');
    buffer.writeln(
      '/// Linearly interpolates the provided objects based on the given [t] value.',
    );
    buffer.writeln(
      'static $className lerp($className a, $className? b, double t) {',
    );
    buffer.writeln('if (b is! $className) {');
    buffer.writeln('return a;');
    buffer.writeln('}');
    buffer.writeln('');

    buffer.writeln('return $className(');
    for (var color in colors) {
      buffer.writeln('$color: Color.lerp(a.$color, b.$color, t)!,');
    }

    for (var colors in opacities.values) {
      for (var color in colors) {
        buffer.writeln('$color: Color.lerp(a.$color, b.$color, t)!,');
      }
    }

    buffer.writeln(');');
    buffer.writeln('}');

    buffer.writeln('}');

    buffer.writeln('');

    return buffer.toString();
  }
}

class _ColorWithOpacity {
  _ColorWithOpacity(this.original, this.opacity);

  final String original;
  final int opacity;

  @override
  String toString() => original;
}
