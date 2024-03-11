part of 'extensions.dart';

extension DateTimeExtensions on DateTime {
  /// Converts a UTC [DateTime] to a formatted local date and time [String]
  String get toLocalFormatted {
    return toLocal().toString().replaceRange(16, 26, '');
  }
}

extension DurationExtensions on Duration {
  String format() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    final hour = twoDigits(inHours);
    return "${hour == '00' ? '' : '$hour:'}$twoDigitMinutes:$twoDigitSeconds";
  }
}
