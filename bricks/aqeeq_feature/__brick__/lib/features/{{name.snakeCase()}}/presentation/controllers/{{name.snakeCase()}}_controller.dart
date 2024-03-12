part of 'controllers.dart';

@Riverpod(keepAlive: true)
class {{name.pascalCase()}}Controller extends _${{name.pascalCase()}}Controller {
  {{#usecases}}late {{..pascalCase()}} _{{..camelCase()}};{{/usecases}}

  @override
  Future<void> build() async {
    final repository = await ref.read({{name.camelCase()}}RepositoryProvider.future);
    {{#usecases}}_{{..camelCase()}} = {{..pascalCase()}}(repository);{{/usecases}}
  }

  {{#usecases}}// TODO(aqeeq): Modify, move or remove as needed
  Future<{{..pascalCase()}}Response> {{..camelCase()}}() {
    return _{{..camelCase()}}();
  }
  {{/usecases}}
}
