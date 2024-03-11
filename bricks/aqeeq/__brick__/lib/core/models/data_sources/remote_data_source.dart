part of '../models.dart';

abstract class RemoteDataSource extends DataSource {
  const RemoteDataSource(this.client);
  final HttpService client;
}
