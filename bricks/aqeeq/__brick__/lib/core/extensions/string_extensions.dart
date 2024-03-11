part of 'extensions.dart';

extension StringExtensions on String {
  /// Generates a 64-bit [int] hash of the [String]
  int fastHash() {
    //ignore: avoid_js_rounded_ints
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < length) {
      final codeUnit = codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }

  /// Debug prints a [String] JSON in a readable format to the console
  void printAsJson() {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      final prettyPrint = encoder.convert(this);
      debugPrint(prettyPrint);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Replaces Hindu and Persian numbers to Arabic numbers
  String replaceHinduPersianNumbers() {
    const arabic = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    const hindu = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    var output = this;
    for (var i = 0; i < arabic.length; i++) {
      output = output.replaceAll(persian[i], arabic[i]);
      output = output.replaceAll(hindu[i], arabic[i]);
    }
    return output;
  }

  /// Checks if the [String] is RTL
  bool get isRTL {
    return Bidi.detectRtlDirectionality(this);
  }

  /// Converts a color [String] is in the format `aabbcc` or `aabbccff` with an
  /// optional leading `#` to [Color]
  Color toColor({String? opacity}) {
    var hexString = this;
    final buffer = StringBuffer();
    hexString = hexString.replaceFirst('#', '');
    hexString = hexString.replaceFirst('0x', '');
    if (hexString.length == 6) {
      hexString = (opacity ?? 'ff') + hexString;
    } else if (hexString.length == 3) {
      hexString =
          (opacity ?? 'ff') + hexString.characters.map((e) => e + e).join();
    } else {
      if (opacity != null) {
        hexString = hexString.replaceRange(0, 1, opacity);
      }
    }
    buffer.write(hexString);
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  Color hashToColor() {
    final hash = fastHash();
    return [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.orange,
      Colors.amber,
      Colors.purple,
      Colors.deepPurple,
    ][hash % 8];
  }

  /// Parses a [Duration] from a [String] in the format `HH:MM:SS`
  Duration parseHHMMSSDuration() {
    final digits = split(':');
    return Duration(
      hours: int.parse(digits[0]),
      minutes: int.parse(digits[1]),
      seconds: int.parse(digits[2]),
    );
  }
}
