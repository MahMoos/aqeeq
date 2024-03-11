part of 'widgets.dart';

class EndlessAnimatedListView<T> extends StatefulWidget {
  const EndlessAnimatedListView({
    required this.provider,
    required this.builder,
    this.sliverAppBar,
    super.key,
  });

  final PaginableController<T> provider;
  final Widget Function(BuildContext, T) builder;
  final Widget? sliverAppBar;

  @override
  State<EndlessAnimatedListView<T>> createState() =>
      _EndlessAnimatedListViewState();
}

class _EndlessAnimatedListViewState<T> extends State<EndlessAnimatedListView<T>>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          return CustomScrollView(
            slivers: [
              if (widget.sliverAppBar != null) widget.sliverAppBar!,
              CupertinoSliverRefreshControl(
                onRefresh: () => ref.refresh(widget.provider.future),
              ),
              ref.watch(widget.provider).when(
                    data: (data) => data.isNotEmpty
                        ? SliverAnimatedList(
                            initialItemCount: data.length,
                            itemBuilder: (
                              BuildContext context,
                              int index,
                              Animation<double> animation,
                            ) =>
                                SlideTransition(
                              position: Tween(
                                begin: Offset(-0.2 * index, 0),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.decelerate,
                                ),
                              ),
                              child: widget.builder(context, data[index]),
                            ),
                          )
                        : const SliverToBoxAdapter(
                            child: StatusView.noResults(),
                          ),
                    error: (err, stack) => SliverToBoxAdapter(
                      child: StatusView.anErrorOccurred(
                        action: () => ref.refresh(widget.provider.future),
                      ),
                    ),
                    loading: () => const SliverFillRemaining(
                      hasScrollBody: false,
                      child: StatusView.loading(),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
