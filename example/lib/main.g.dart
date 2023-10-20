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

  Fonts._({
    required this.largest,
    required this.large,
  });

  final Largest largest;
  final Large large;

  /// Returns the sizes generated.
  List<dynamic> get sizes => [largest, large];

  /// Returns the [TextStyle]s generated.
  List<TextStyle> get styles => [...largest.styles, ...large.styles];

  /// Linearly interpolates the provided objects based on the given [t] value.
  static Fonts lerp(Fonts a, Fonts? b, double t) {
    return Fonts._(
      largest: Largest.lerp(a.largest, b?.largest, t),
      large: Large.lerp(a.large, b?.large, t),
    );
  }
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

  Largest._({
    required this.bold,
    required this.regular,
  });

  final LargestBold bold;
  final LargestRegular regular;

  /// Returns the weights generated.
  List<dynamic> get weights => [bold, regular];

  /// Returns the [TextStyle]s generated.
  List<TextStyle> get styles => [...bold.styles, ...regular.styles];

  /// Linearly interpolates the provided objects based on the given [t] value.
  static Largest lerp(Largest a, Largest? b, double t) {
    return Largest._(
      bold: LargestBold.lerp(a.bold, b?.bold, t),
      regular: LargestRegular.lerp(a.regular, b?.regular, t),
    );
  }
}

class LargestBold {
  LargestBold({
    required TextStyle style,
    required Color onBackground,
    required Color primary,
  })  : onBackground = style.copyWith(color: onBackground),
        primary = style.copyWith(color: primary);

  LargestBold._({
    required this.onBackground,
    required this.primary,
  });

  final TextStyle onBackground;
  final TextStyle primary;

  /// Returns the [TextStyle]s defined in this class.
  List<TextStyle> get styles => [onBackground, primary];

  /// Linearly interpolates the provided objects based on the given [t] value.
  static LargestBold lerp(LargestBold a, LargestBold? b, double t) {
    return LargestBold._(
      onBackground: TextStyle.lerp(a.onBackground, b?.onBackground, t)!,
      primary: TextStyle.lerp(a.primary, b?.primary, t)!,
    );
  }
}

class LargestRegular {
  LargestRegular({
    required TextStyle style,
    required Color onBackground,
    required Color primary,
  })  : onBackground = style.copyWith(color: onBackground),
        primary = style.copyWith(color: primary);

  LargestRegular._({
    required this.onBackground,
    required this.primary,
  });

  final TextStyle onBackground;
  final TextStyle primary;

  /// Returns the [TextStyle]s defined in this class.
  List<TextStyle> get styles => [onBackground, primary];

  /// Linearly interpolates the provided objects based on the given [t] value.
  static LargestRegular lerp(LargestRegular a, LargestRegular? b, double t) {
    return LargestRegular._(
      onBackground: TextStyle.lerp(a.onBackground, b?.onBackground, t)!,
      primary: TextStyle.lerp(a.primary, b?.primary, t)!,
    );
  }
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

  Large._({
    required this.bold,
    required this.regular,
  });

  final LargeBold bold;
  final LargeRegular regular;

  /// Returns the weights generated.
  List<dynamic> get weights => [bold, regular];

  /// Returns the [TextStyle]s generated.
  List<TextStyle> get styles => [...bold.styles, ...regular.styles];

  /// Linearly interpolates the provided objects based on the given [t] value.
  static Large lerp(Large a, Large? b, double t) {
    return Large._(
      bold: LargeBold.lerp(a.bold, b?.bold, t),
      regular: LargeRegular.lerp(a.regular, b?.regular, t),
    );
  }
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

  LargeBold._({
    required this.onBackground,
    required this.primary,
    required this.secondary,
  });

  final TextStyle onBackground;
  final TextStyle primary;
  final TextStyle secondary;

  /// Returns the [TextStyle]s defined in this class.
  List<TextStyle> get styles => [onBackground, primary, secondary];

  /// Linearly interpolates the provided objects based on the given [t] value.
  static LargeBold lerp(LargeBold a, LargeBold? b, double t) {
    return LargeBold._(
      onBackground: TextStyle.lerp(a.onBackground, b?.onBackground, t)!,
      primary: TextStyle.lerp(a.primary, b?.primary, t)!,
      secondary: TextStyle.lerp(a.secondary, b?.secondary, t)!,
    );
  }
}

class LargeRegular {
  LargeRegular({
    required TextStyle style,
    required Color onBackground,
    required Color onPrimary,
  })  : onBackground = style.copyWith(color: onBackground),
        onPrimary = style.copyWith(color: onPrimary);

  LargeRegular._({
    required this.onBackground,
    required this.onPrimary,
  });

  final TextStyle onBackground;
  final TextStyle onPrimary;

  /// Returns the [TextStyle]s defined in this class.
  List<TextStyle> get styles => [onBackground, onPrimary];

  /// Linearly interpolates the provided objects based on the given [t] value.
  static LargeRegular lerp(LargeRegular a, LargeRegular? b, double t) {
    return LargeRegular._(
      onBackground: TextStyle.lerp(a.onBackground, b?.onBackground, t)!,
      onPrimary: TextStyle.lerp(a.onPrimary, b?.onPrimary, t)!,
    );
  }
}
