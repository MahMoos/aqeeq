part of '../models.dart';

abstract class BaseRepository {
  const BaseRepository({this.localDataSource, this.remoteDataSource})
      : assert(
          localDataSource != null || remoteDataSource != null,
          'Repository must have either a local or a remote data source',
        );
  final LocalDataSource? localDataSource;
  final RemoteDataSource? remoteDataSource;
}
