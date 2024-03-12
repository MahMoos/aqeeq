import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/api/api.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/services/storage/storage_service.dart';
import '../../data/data_sources/{{name.snakeCase()}}_data_source.dart';
import '../../data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../../domain/use_cases/use_cases.dart';

part 'controllers.g.dart';
part '{{name.snakeCase()}}_controller.dart';

@Riverpod(keepAlive: true)
Future<{{name.pascalCase()}}Repository> {{name.camelCase()}}Repository({{name.pascalCase()}}RepositoryRef ref) async {
  final storage = await ref.read(storageServiceProvider.future);
  final client = await ref.getDebouncedHttpService();
  return {{name.pascalCase()}}RepositoryImpl(
    remote: Remote{{name.pascalCase()}}DataSource(client),
    storage: Local{{name.pascalCase()}}DataSource(storage),
  );
}
{{#paginated_usecases}}
// TODO(aqeeq): Modify, move or remove as needed
@Riverpod(keepAlive: true)
class {{..pascalCase()}}Controller extends _${{..pascalCase()}}Controller
  with PaginationController<{{..pascalCase()}}Response> {
  late {{..pascalCase()}} _{{..camelCase()}};
  late {{..pascalCase()}}Params _paginatedParams;

  @override
  Future<List<{{..pascalCase()}}Response>> build({
    String? query,
  }) async {
    final repository = await ref.watch({{name.camelCase()}}RepositoryProvider.future);
    _{{..camelCase()}} = {{..pascalCase()}}(repository);
    _paginatedParams = {{..pascalCase()}}Params(query: query);
    return loadData();
  }

  @override
  FutureOr<List<{{..pascalCase()}}Response>> loadData() async {
    return _{{..camelCase()}}(_paginatedParams);
  }
}
{{/paginated_usecases}}
