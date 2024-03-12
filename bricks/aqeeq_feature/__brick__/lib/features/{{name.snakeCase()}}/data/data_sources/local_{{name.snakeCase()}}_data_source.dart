part of '{{name.snakeCase()}}_data_source.dart';

class Local{{name.pascalCase()}}DataSource extends {{name.pascalCase()}}DataSource implements LocalDataSource {
  const Local{{name.pascalCase()}}DataSource(this.storage);

  @override
  final StorageService storage;

}
