part of 'widgets.dart';

class StatusView extends StatelessWidget {
  const StatusView({
    super.key,
    this.illustration,
    this.title,
    this.message,
    this.action,
    this.actionButtonLabel,
  });

  const factory StatusView.loading() = _Loading;

  const factory StatusView.pageNotFound() = _PageNotFound;

  const factory StatusView.noResults() = _NoResults;

  const factory StatusView.anErrorOccurred({
    String? message,
    VoidCallback? action,
  }) = _AnErrorOccurred;

  final UnDrawIllustration? illustration;
  final String? title;
  final String? message;
  final String? actionButtonLabel;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (illustration != null)
              SizedBox(
                height: 300,
                child: UnDraw(
                  illustration: illustration!,
                  color: context.theme.primaryColor,
                  width: 300,
                  placeholder: const SizedBox(
                    height: 300,
                  ),
                ),
              ),
            if (title != null)
              Text(
                title!,
              ).fontSize(21).paddingOnly(bottom: 16),
            if (message != null)
              Text(
                message!,
              ).alignAtCenter(),
            const SizedBox(height: 16),
            if (action != null)
              ElevatedButton(
                onPressed: action,
                child: Text(actionButtonLabel ?? ''),
              ),
          ],
        ),
      ),
    );
  }
}

class _PageNotFound extends StatusView {
  const _PageNotFound();

  @override
  Widget build(BuildContext context) {
    return StatusView(
      illustration: UnDrawIllustration.page_not_found,
      title: context.strings.notFound,
      action: () => context.goNamed('home'),
      actionButtonLabel: context.strings.goToHome,
    );
  }
}

class _Loading extends StatusView {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _NoResults extends StatusView {
  const _NoResults();

  @override
  Widget build(BuildContext context) {
    return StatusView(
      illustration: UnDrawIllustration.not_found,
      title: context.strings.noResults,
    );
  }
}

class _AnErrorOccurred extends StatusView {
  const _AnErrorOccurred({
    super.message,
    super.action,
  });

  @override
  Widget build(BuildContext context) {
    return StatusView(
      illustration: UnDrawIllustration.lost,
      title: context.strings.errorOccurred,
      message: message,
      action: action,
      actionButtonLabel: context.strings.tryAgain,
    );
  }
}
