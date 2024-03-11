part of '../api.dart';

class PostsParams extends PaginatedParams {
  const PostsParams({
    super.page,
    this.query,
    this.subjectIds,
    this.isFeatured,
  });

  final String? query;
  final List<String>? subjectIds;
  final bool? isFeatured;

  PostsParams copyWith({
    int? page,
    List<String>? subjectIds,
    bool? isFeatured,
  }) =>
      PostsParams(
        page: page ?? super.page,
        query: query ?? this.query,
        subjectIds: subjectIds ?? this.subjectIds,
        isFeatured: isFeatured ?? this.isFeatured,
      );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        if (query != null) 'Query': query,
        if (subjectIds != null && subjectIds!.isNotEmpty)
          'Subjects': subjectIds,
        if (isFeatured != null) 'IsFeatured': isFeatured.toString(),
      };

  @override
  PostsParams nextPage() => copyWith(page: page + 1);
}
