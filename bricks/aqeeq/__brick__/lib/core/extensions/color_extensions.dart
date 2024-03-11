part of 'extensions.dart';

extension ColorExtensions on Color {
  /// Converts a [Color] to [String] format and prefixes a hash sign if
  /// [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  /// Returns a shade of a [Color] from a double value
  ///
  /// The 'darker' boolean determines whether the shade
  /// should be .1 darker or lighter than the provided color
  Color getShade(double value, {bool darker = false}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }

  /// Returns a [MaterialColor] from a [Color] object
  MaterialColor toMaterialColor() {
    final colorShades = <int, Color>{
      50: getShade(0.5),
      100: getShade(0.4),
      200: getShade(0.3),
      300: getShade(0.2),
      400: getShade(0.1),
      500: this, //Primary value
      600: getShade(0.1, darker: true),
      700: getShade(0.15, darker: true),
      800: getShade(0.2, darker: true),
      900: getShade(0.25, darker: true),
    };
    return MaterialColor(value, colorShades);
  }
}
