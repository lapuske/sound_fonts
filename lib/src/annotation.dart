/// Annotation to generate `Fonts` class around.
class SoundFonts {
  const SoundFonts(
    this.schema, {
    this.prefix,
    this.stylesGetter = true,
  });

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

  /// Indicates, whether the generated classes should contain the
  /// `List<TextStyle> get styles` returning the [TextStyle]s used.
  final bool stylesGetter;
}
