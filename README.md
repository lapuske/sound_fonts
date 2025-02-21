[`sound_fonts`]
============

[`sound_fonts`] is a `build_runner` package generating `Fonts` class to encapsulate all the fonts your Flutter application uses with the easy and understandable namings. 

* [Getting started](#getting-started)
* [Usage](#usage)




## Getting started

Simply add the package to your `pubspec.yaml`:

```yaml
dependencies:
  sound_fonts: ^0.1.2
```

or from GitHub directly:

```yaml
dependencies:
  sound_fonts:
    git: https://github.com/lapuske/sound_fonts
```



## Usage

Detailed example is placed under `/example` directory.


### Fonts

Basically you define the annotation and run the `build_runner`:

```dart
import 'package:flutter/rendering.dart';
import 'package:sound_fonts/sound_fonts.dart';

part 'main.g.dart';

@SoundFonts({
  'largest': {
    'bold': ['onBackground', 'primary'],
    'regular': ['onBackground', 'primary'],
  },
  'large': {
    'bold': ['onBackground', 'primary', 'secondary'],
    'regular': ['onBackground', 'onPrimary'],
  },
})
class AnnotatedFonts {}
```

This generates a file with the following class (`getter`s and `lerp` omitted):

```dart
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
}
```

Your application is expected to construct it with the parameters it requires:

```dart
final fonts = Fonts(
  style: TextStyle(fontFamily: '123'),
  largest: 27,
  large: 24,
  bold: FontWeight.bold,
  regular: FontWeight.regular,
  onBackground: Colors.white,
  primary: Colors.blue,
  secondary: Colors.grey,
  onPrimary: Colors.black,
);
```

The generated class may even be included to your `Theme.of` in the `ThemeExtension` form:

```dart
class FontsExtension extends ThemeExtension<Fonts> {
  // ...
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light().copyWith(
        extensions: [FontsExtension()],
      ),
    ),
  );
}
```

Then, throughout the application you may use the fonts in the following manner:

```dart
@override
Widget build(BuildContext context) {
  final fonts = Theme.of(context).extension<FontsExtension>()!;

  return Text('Hello', style: fonts.medium.regular.onBackground);
}
```


### Colors

Package is capable of generating the colors palette in the same manner as the fonts. To accomplish this, use the `SoundColors` annotation:

```dart
import 'package:flutter/rendering.dart';
import 'package:sound_fonts/sound_fonts.dart';

part 'main.g.dart';

@SoundColors(['onBackground', 'primary', 'secondary', 'secondary50'])
class AnnotatedColors {}
```

This generates a file with the following class (`lerp` omitted):

```dart
class Palette {
  Palette({
    required this.onBackground,
    required this.primary,
    required this.secondary,
    Color? secondary50,
  })  : secondary50 = secondary50 ?? secondary.withValues(alpha: 0.5);

  final Color onBackground;
  final Color primary;
  final Color secondary;
  final Color secondary50;
}
```

Your application is expected to construct it with the parameters it requires:

```dart
final colors = Palette(
  onBackground: Colors.white,
  primary: Colors.blue,
  secondary: Colors.grey,
);
```

The generated class may even be included to your `Theme.of` in the `ThemeExtension` form:

```dart
class ColorsExtension extends ThemeExtension<Palette> {
  // ...
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light().copyWith(
        extensions: [ColorsExtension()],
      ),
    ),
  );
}
```

Then, throughout the application you may use the colors in the following manner:

```dart
@override
Widget build(BuildContext context) {
  final colors = Theme.of(context).extension<ColorsExtension>()!;
  
  return ColoredBox(color: colors.onBackground);
}
```


### Both

It is recommended to unite the `Fonts` and `Palette` classes generated so that your styles are in one place.

To do that, create a `Style` class and include both into it:

```dart
class Style {
  const Style({
    this.fonts,
    this.colors,
  });

  final Fonts fonts;
  final Palette colors;
}
```

Then, create a `theme.dart` file, and add the following:

```dart
class Themes {
  /// Returns a light theme.
  static ThemeData light() {
    final Palette colors = Palette(
      /* */
    );

    final Fonts fonts = Fonts(
      /* */
    );

    return ThemeData.light().copyWith(
      extensions: [
        Style(
          fonts: fonts,
          colors: colors,
        )
      ],
      /* Customize the Flutter's theme using the values above */
    );
  }
}
```

Additionally the following extensions is recommended to have in the `theme.dart` file:

```dart
/// Extension adding [Style] handy getter from the [ThemeData].
extension ThemeStylesExtension on ThemeData {
  /// Returns the [Style] of this [ThemeData].
  Style get style => extension<Style>()!;
}
```

Now you can access any values you're adding with a easy single call of the getter above:

```dart
@override
Widget build(BuildContext context) {
  final style = Theme.of(context).style;

  return ColoredBox(
    color: style.colors.primary,
    child: Text(
      'Hello',
      style: style.fonts.medium.regular.onBackground,
    ),
  );
}
```



[`sound_fonts`]: https://pub.dev/packages/sound_fonts