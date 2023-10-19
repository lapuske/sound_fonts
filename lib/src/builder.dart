import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';

Builder builder(BuilderOptions options) {
  return SharedPartBuilder([FontsGenerator()], 'fonts');
}

class FontsGenerator extends GeneratorForAnnotation<SoundFonts> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final String prefix = annotation.peek('prefix')?.stringValue ?? '';
    final Map<String, Map<String, List<String>>> schema = {};

    final raw = annotation.read('schema').mapValue;
    for (var e in raw.entries) {
      schema[e.key!.toStringValue()!] = {
        for (var v in e.value!.toMapValue()!.entries)
          v.key!.toStringValue()!:
              v.value!.toListValue()!.map((e) => e.toStringValue()!).toList(),
      };
    }

    final StringBuffer buffer = StringBuffer();

    buffer.writeln('class ${prefix}Fonts {');

    // Constructor.
    buffer.writeln('${prefix}Fonts({');
    buffer.writeln('required TextStyle style,');
    for (var size in schema.keys) {
      buffer.writeln('required double $size,');
    }
    for (var weight in schema.values.expand((e) => e.keys).toSet()) {
      buffer.writeln('required FontWeight $weight,');
    }
    for (var color in schema.values
        .map((e) => e.values)
        .expand((e) => e)
        .expand((e) => e)
        .toSet()) {
      buffer.writeln('required Color $color,');
    }
    buffer.writeln('}) :');
    for (int i = 0; i < schema.entries.length; ++i) {
      final sizes = schema.entries.elementAt(i);
      buffer.writeln('${sizes.key} = $prefix${sizes.key.capitalize}(');
      buffer.writeln('style: style.copyWith(fontSize: ${sizes.key}),');
      for (var weight in sizes.value.keys) {
        buffer.writeln('$weight: $weight,');
      }
      for (var color in sizes.value.values.expand((e) => e).toSet()) {
        buffer.writeln('$color: $color,');
      }
      buffer.writeln(')');
      if (i == schema.entries.length - 1) {
        buffer.writeln(';');
      } else {
        buffer.writeln(',');
      }
    }
    buffer.writeln('');

    // Values.
    for (var size in schema.entries) {
      buffer.writeln('final $prefix${size.key.capitalize} ${size.key};');
    }
    buffer.writeln('}');

    buffer.writeln('');
    buffer.writeln('');

    // Classes of sizes.
    for (var size in schema.entries) {
      final String className = '$prefix${size.key.capitalize}';
      buffer.writeln('class $className {');

      // Constructor.
      buffer.writeln('$className({');
      buffer.writeln('required TextStyle style,');
      for (var weight in size.value.entries) {
        buffer.writeln('required FontWeight ${weight.key},');
      }
      for (var color in size.value.values.expand((e) => e).toSet()) {
        buffer.writeln('required Color $color,');
      }
      buffer.writeln('}) : ');
      for (var i = 0; i < size.value.entries.length; ++i) {
        final weight = size.value.entries.elementAt(i);
        buffer.writeln(
          '${weight.key} = $prefix${size.key.capitalize}${weight.key.capitalize}(',
        );
        buffer.writeln('style: style.copyWith(fontWeight: ${weight.key}),');
        for (var c in weight.value) {
          buffer.writeln('$c: $c,');
        }
        buffer.writeln(')');
        if (i == size.value.entries.length - 1) {
          buffer.writeln(';');
        } else {
          buffer.writeln(',');
        }
      }
      buffer.writeln('');

      // Fields.
      for (var weight in size.value.entries) {
        buffer.writeln(
          'final $prefix${size.key.capitalize}${weight.key.capitalize} ${weight.key};',
        );
      }
      buffer.writeln('}');
      buffer.writeln();

      // Classes of weights.
      for (var weight in size.value.entries) {
        final String className =
            '$prefix${size.key.capitalize}${weight.key.capitalize}';

        final List<String> colors = weight.value;

        buffer.writeln('class $className {');

        // Constructor.
        buffer.writeln('$className({');
        buffer.writeln('required TextStyle style,');
        for (var color in colors) {
          buffer.writeln('required Color $color,');
        }
        buffer.writeln('}) :');
        for (int i = 0; i < colors.length; ++i) {
          final String color = colors[i];
          buffer.write('$color = style.copyWith(color: $color)');
          if (i == colors.length - 1) {
            buffer.writeln(';');
          } else {
            buffer.writeln(',');
          }
        }

        buffer.writeln('');

        // Fields.
        for (var color in colors) {
          buffer.writeln('final TextStyle $color;');
        }

        buffer.writeln('}');
        buffer.writeln();
      }
    }

    return buffer.toString();
  }
}

extension on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
