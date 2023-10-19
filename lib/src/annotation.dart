/// Annotation to generate `Fonts` class around.
class SoundFonts {
  const SoundFonts(this.schema, {this.prefix});

  /// Schema to generate `Fonts` structure from.
  ///
  /// Goes like this:
  /// ```dart
  /// {
  ///   'fontSize1': {
  ///     'fontWeight1': ['color1', 'color2'],
  ///     'fontWeight2': ['color1', 'color2'],
  ///   },
  ///   'fontSize2': {
  ///     'fontWeight1': ['color1'],
  ///   }
  /// }
  /// ```
  final Map<String, Map<String, List<String>>> schema;

  /// Prefix to apply to the classes being generated.
  final String? prefix;
}
