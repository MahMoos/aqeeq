part of '../api.dart';
{{#paginated_usecases}}
class {{..pascalCase()}}Params extends PaginatedParams {
  const {{..pascalCase()}}Params({
    super.page,
    this.query,
  });

  final String? query;

  {{..pascalCase()}}Params copyWith({
    int? page,
    String? query,
  }) =>
  {{..pascalCase()}}Params(
        page: page ?? super.page,
        query: query ?? this.query,
      );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        if (query != null) 'Query': query,
      };

  @override
  {{..pascalCase()}}Params nextPage() => copyWith(page: page + 1);
}{{/paginated_usecases}}
