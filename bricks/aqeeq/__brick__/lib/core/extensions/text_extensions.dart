part of 'extensions.dart';

extension TextEditingControllerExtensions on TextEditingController {
  /// Selects all the text inside the [TextField]
  void selectAll() {
    if (text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}

extension TextStyleExtensions on TextStyle {
  /// Applies a drop shadow to the text.
  /// Defaults to a black 54% opacity (if [decorationColor] is null) shadow
  /// with a blur radius of 12.
  TextStyle dropShadow({List<Shadow>? shadows}) {
    return copyWith(
      shadows: shadows ??
          [
            Shadow(
              color: decorationColor ?? Colors.black54,
              blurRadius: 12,
            ),
          ],
    );
  }
}
