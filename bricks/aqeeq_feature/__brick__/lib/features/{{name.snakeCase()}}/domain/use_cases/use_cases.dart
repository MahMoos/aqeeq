import '../../../../common/api/api.dart';
import '../../../../core/models/models.dart';
import '../entities/entities.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';

{{#usecases}}// TODO(aqeeq): Modify, move or remove as needed
class {{..pascalCase()}} with UseCase<{{..pascalCase()}}Response, NoParams?> {
  const {{..pascalCase()}}(this.repository);
  final {{name.pascalCase()}}Repository repository;

  @override
  Future<{{..pascalCase()}}Response> call([NoParams? params]) {
    return repository.{{..camelCase()}}();
  }
}
{{/usecases}}
{{#paginated_usecases}}// TODO(aqeeq): Modify, move or remove as needed
class {{..pascalCase()}} with UseCase<List<{{..pascalCase()}}Response>, {{..pascalCase()}}Params> {
  const {{..pascalCase()}}(this.repository);

  final {{name.pascalCase()}}Repository repository;

  @override
  Future<List<{{..pascalCase()}}Response>> call({{..pascalCase()}}Params params) {
    return repository.{{..camelCase()}}(params);
  }
}
{{/paginated_usecases}}
