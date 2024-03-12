import '../../../../common/api/api.dart';
import '../../../../core/models/models.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../data_sources/{{name.snakeCase()}}_data_source.dart';
import '../models/models.dart';

class {{name.pascalCase()}}RepositoryImpl extends BaseRepository implements {{name.pascalCase()}}Repository {
  const {{name.pascalCase()}}RepositoryImpl({required this.remote, required this.storage})
      : super(remoteDataSource: remote, localDataSource: storage);

  final Remote{{name.pascalCase()}}DataSource remote;
  final Local{{name.pascalCase()}}DataSource storage;

{{#usecases}}
  @override
  Future<{{..pascalCase()}}Response> {{..camelCase()}}() async {
    return (await remote.{{..camelCase()}}()).toEntity();
  }
{{/usecases}}
{{#paginated_usecases}}
  @override
  Future<List<{{..pascalCase()}}Response>> {{..camelCase()}}({{..pascalCase()}}Params params) async {
    return (await remote.{{..camelCase()}}(params))
        .map((e) => e.toEntity())
        .toList();
  }
{{/paginated_usecases}}
}
