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

/// Annotation to generate `Palette` class around.
class SoundColors {
  const SoundColors(this.colors, {this.prefix});

  /// List of color names to generate `Colors` structure from.
  ///
  /// Goes like this:
  /// ```dart
  /// {
  ///   'primary',
  ///   'onPrimary',
  ///   'secondary',
  ///   'onSecondary',
  ///   'background',
  ///   'background7',
  ///   'background50'
  /// }
  /// ```
  ///
  /// Note that if the color is ending with a number, then there must be a
  /// non-numbered color with the same name. This number is the percent of
  /// opacity to apply to in order to receive the color.
  final Set<String> colors;

  /// Prefix to apply to the classes being generated.
  final String? prefix;
}
