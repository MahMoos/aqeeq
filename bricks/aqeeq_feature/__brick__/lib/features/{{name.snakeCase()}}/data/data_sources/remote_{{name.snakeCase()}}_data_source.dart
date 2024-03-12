part of '{{name.snakeCase()}}_data_source.dart';

class Remote{{name.pascalCase()}}DataSource extends {{name.pascalCase()}}DataSource implements RemoteDataSource {
  const Remote{{name.pascalCase()}}DataSource(this.client);

  @override
  final HttpService client;

{{#usecases}}
  @override
  Future<{{..pascalCase()}}ResponseModel> {{..camelCase()}}() {
    return client.get<{{..pascalCase()}}ResponseModel>(
      ApiRoutes.{{..camelCase()}}(),
      parser: (json) => {{..pascalCase()}}ResponseModel.fromJson(json as Map<String, dynamic>),
    );
  }
{{/usecases}}
{{#paginated_usecases}}
  @override
  Future<List<{{..pascalCase()}}ResponseModel>> {{..camelCase()}}({{..pascalCase()}}Params params) {
    return client.getList<{{..pascalCase()}}ResponseModel>(ApiRoutes.{{..camelCase()}}(params),
      parser: (json) => {{..pascalCase()}}ResponseModel.fromJson(json as Map<String, dynamic>),
    );
  }
{{/paginated_usecases}}
}
