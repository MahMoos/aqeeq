part of 'extensions.dart';

extension BuildContextExtensions on BuildContext {
  /// Formats [amount] to a number with [currency] according to the [currency]
  /// and locale. Returns "Free" if [amount] equals zero.
  String formatPrice(double amount, [String currency = 'IQD']) {
    if (amount == 0) return strings.free;
    return formatBalance(amount, currency);
  }

  /// Formats [amount] to a number with [currency] according to the [currency]
  /// and locale.
  String formatBalance(double amount, [String currency = 'IQD']) {
    return NumberFormat.currency(
      decimalDigits: currency == 'IQD' ? 0 : 2,
      customPattern: currency == 'IQD'
          ? '##,### ${AppLocalizations.of(this).currency(currency)}'
          : '##,###.## ${AppLocalizations.of(this).currency(currency)}',
    ).format(amount);
  }

  /// A number format for compact representations, e.g. "1.2M" instead
  /// of "1,200,000".
  String formatIntCompact(int number) {
    return NumberFormat.compact().format(number);
  }

  /// All app localizations strings
  AppLocalizations get strings => AppLocalizations.of(this);

  /// The locale of the Localizations widget for the widget tree that
  /// corresponds to [BuildContext] `context`.
  ///
  /// If no [Localizations] widget is in scope then the [Localizations.localeOf]
  /// method will throw an exception.
  Locale get locale => Localizations.localeOf(this);

  /// Returns true if the current locale is RTL (e.g. Arabic).
  bool get isRTL =>
      Bidi.isRtlLanguage(Localizations.localeOf(this).languageCode);

  /// Clears SnackBars and shows a [SnackBar]
  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  /// Clears SnackBars and shows a [message] in a [SnackBar]
  void showSnackBarMessage(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}
