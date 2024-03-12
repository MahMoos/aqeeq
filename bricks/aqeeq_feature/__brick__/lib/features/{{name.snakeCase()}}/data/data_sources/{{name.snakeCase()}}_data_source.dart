import '../../../../common/api/api.dart';
import '../../../../core/models/models.dart';
import '../../../../core/services/http/http_service.dart';
import '../../../../core/services/storage/storage_service.dart';
import '../models/models.dart';

part 'local_{{name.snakeCase()}}_data_source.dart';
part 'remote_{{name.snakeCase()}}_data_source.dart';

abstract class {{name.pascalCase()}}DataSource extends DataSource {
  const {{name.pascalCase()}}DataSource();

{{#usecases}}
  Future<{{..pascalCase()}}ResponseModel> {{..camelCase()}}();
{{/usecases}}
{{#paginated_usecases}}
  Future<List<{{..pascalCase()}}ResponseModel>> {{..camelCase()}}({{..pascalCase()}}Params params);
{{/paginated_usecases}}
}
