part of '../models.dart';

abstract class LocalDataSource extends DataSource {
  const LocalDataSource(this.storage);
  final StorageService storage;
}
