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
