part of '../models.dart';

class PaginatedParams implements QueryParams {
  const PaginatedParams({
    this.page = 0,
    this.pageSize = 20,
    this.sort,
  });

  final int page;
  final int pageSize;
  final String? sort;

  PaginatedParams nextPage() => PaginatedParams(
        page: page + 1,
        pageSize: pageSize,
        sort: sort,
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'Skip': '${page * pageSize}',
      'Take': pageSize.toString(),
      if (sort != null) 'Sort': sort,
    };
  }
}
