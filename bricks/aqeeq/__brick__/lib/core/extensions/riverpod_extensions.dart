part of 'extensions.dart';

typedef PaginableController<T>
// ignore: invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
    = AsyncNotifierProviderBase<PaginationController<T>, List<T>>;

extension DebounceAndCancelExtension<T> on Ref<T> {
  /// Wait for [duration] (defaults to 500ms), and then return a [HttpService]
  /// which can be used to make a request.
  ///
  /// That client will automatically be closed when the provider is disposed.
  Future<HttpService> getDebouncedHttpService([Duration? duration]) async {
    var didDispose = false;
    onDispose(() => didDispose = true);
    await Future<void>.delayed(duration ?? const Duration(milliseconds: 500));
    if (didDispose) {
      throw Exception('Cancelled');
    }
    final service = read(httpServiceProvider);
    onDispose(service.close);
    return service;
  }
}

// ignore: invalid_use_of_internal_member
mixin PaginationController<T> on AsyncNotifierBase<List<T>> {
  late PaginatedParams _paginatedParams;

  List<T>? get data {
    try {
      return state.requireValue;
      // ignore: avoid_catching_errors
    } on StateError {
      return null;
    }
  }

  int get pageSize => _paginatedParams.pageSize;

  FutureOr<List<T>> loadData();

  Future<void> loadMore() async {
    final oldState = state;
    if (oldState.requireValue.length % _paginatedParams.pageSize != 0) return;
    state = AsyncLoading<List<T>>().copyWithPrevious(oldState);
    state = await AsyncValue.guard<List<T>>(() async {
      _paginatedParams = _paginatedParams.nextPage();
      final res = await loadData();
      res.insertAll(0, state.requireValue);
      return res;
    });
  }

  bool get canLoadMore {
    if (state.isLoading) return false;
    if (!state.hasValue) return false;
    if (state.requireValue.length % _paginatedParams.pageSize != 0) {
      return false;
    }
    return true;
  }
}
