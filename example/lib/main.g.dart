// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// FontsGenerator
// **************************************************************************

class Fonts {
  Fonts({
    required TextStyle style,
    required double largest,
    required double large,
    required FontWeight bold,
    required FontWeight regular,
    required Color onBackground,
    required Color primary,
    required Color secondary,
    required Color onPrimary,
  })  : largest = Largest(
          style: style.copyWith(fontSize: largest),
          bold: bold,
          regular: regular,
          onBackground: onBackground,
          primary: primary,
        ),
        large = Large(
          style: style.copyWith(fontSize: large),
          bold: bold,
          regular: regular,
          onBackground: onBackground,
          primary: primary,
          secondary: secondary,
          onPrimary: onPrimary,
        );

  final Largest largest;
  final Large large;

  /// Returns the sizes generated.
  List<dynamic> get sizes => [largest, large];

  /// Returns the [TextStyle]s generated.
  List<TextStyle> get styles => [...largest.styles, ...large.styles];
}

class Largest {
  Largest({
    required TextStyle style,
    required FontWeight bold,
    required FontWeight regular,
    required Color onBackground,
    required Color primary,
  })  : bold = LargestBold(
          style: style.copyWith(fontWeight: bold),
          onBackground: onBackground,
          primary: primary,
        ),
        regular = LargestRegular(
          style: style.copyWith(fontWeight: regular),
          onBackground: onBackground,
          primary: primary,
        );

  final LargestBold bold;
  final LargestRegular regular;

  /// Returns the weights generated.
  List<dynamic> get weights => [bold, regular];

  /// Returns the [TextStyle]s generated.
  List<TextStyle> get styles => [...bold.styles, ...regular.styles];
}

class LargestBold {
  LargestBold({
    required TextStyle style,
    required Color onBackground,
    required Color primary,
  })  : onBackground = style.copyWith(color: onBackground),
        primary = style.copyWith(color: primary);

  final TextStyle onBackground;
  final TextStyle primary;

  /// Returns the [TextStyle]s defined in this class.
  List<TextStyle> get styles => [onBackground, primary];
}

class LargestRegular {
  LargestRegular({
    required TextStyle style,
    required Color onBackground,
    required Color primary,
  })  : onBackground = style.copyWith(color: onBackground),
        primary = style.copyWith(color: primary);

  final TextStyle onBackground;
  final TextStyle primary;

  /// Returns the [TextStyle]s defined in this class.
  List<TextStyle> get styles => [onBackground, primary];
}

class Large {
  Large({
    required TextStyle style,
    required FontWeight bold,
    required FontWeight regular,
    required Color onBackground,
    required Color primary,
    required Color secondary,
    required Color onPrimary,
  })  : bold = LargeBold(
          style: style.copyWith(fontWeight: bold),
          onBackground: onBackground,
          primary: primary,
          secondary: secondary,
        ),
        regular = LargeRegular(
          style: style.copyWith(fontWeight: regular),
          onBackground: onBackground,
          onPrimary: onPrimary,
        );

  final LargeBold bold;
  final LargeRegular regular;

  /// Returns the weights generated.
  List<dynamic> get weights => [bold, regular];

  /// Returns the [TextStyle]s generated.
  List<TextStyle> get styles => [...bold.styles, ...regular.styles];
}

class LargeBold {
  LargeBold({
    required TextStyle style,
    required Color onBackground,
    required Color primary,
    required Color secondary,
  })  : onBackground = style.copyWith(color: onBackground),
        primary = style.copyWith(color: primary),
        secondary = style.copyWith(color: secondary);

  final TextStyle onBackground;
  final TextStyle primary;
  final TextStyle secondary;

  /// Returns the [TextStyle]s defined in this class.
  List<TextStyle> get styles => [onBackground, primary, secondary];
}

class LargeRegular {
  LargeRegular({
    required TextStyle style,
    required Color onBackground,
    required Color onPrimary,
  })  : onBackground = style.copyWith(color: onBackground),
        onPrimary = style.copyWith(color: onPrimary);

  final TextStyle onBackground;
  final TextStyle onPrimary;

  /// Returns the [TextStyle]s defined in this class.
  List<TextStyle> get styles => [onBackground, onPrimary];
}
