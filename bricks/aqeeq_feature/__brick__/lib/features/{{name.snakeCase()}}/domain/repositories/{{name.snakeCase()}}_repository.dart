import '../../../../common/api/api.dart';
import '../entities/entities.dart';

abstract class {{name.pascalCase()}}Repository {
{{#usecases}}
  Future<{{..pascalCase()}}Response> {{..camelCase()}}();
{{/usecases}}
{{#paginated_usecases}}
  Future<List<{{..pascalCase()}}Response>> {{..camelCase()}}({{..pascalCase()}}Params params);
{{/paginated_usecases}}
}
