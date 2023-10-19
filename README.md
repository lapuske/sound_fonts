[`sound_fonts`]
============

[`sound_fonts`] is a `build_runner` package generating `Fonts` class to encapsulate all the fonts your Flutter application uses with the easy and understandable namings. 

* [Getting started](#getting-started)
* [Usage](#usage)




## Getting started

Simply add the package to your `pubspec.yaml`:

```yaml
dependencies:
  sound_fonts: ^0.1.0
```

or from GitHub directly:

```yaml
dependencies:
  sound_fonts:
    git: https://github.com/lapuske/sound_fonts
```



## Usage

Detailed example is placed under `/example` directory.

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

This generates a generated file with the following class:
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
  return Text('Hello', style: );
}
```




[`sound_fonts`]: https://pub.dev/packages/sound_fonts