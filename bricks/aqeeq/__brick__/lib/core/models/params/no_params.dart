part of '../models.dart';

class NoParams implements QueryParams {
  const NoParams();

  @override
  Map<String, dynamic> toJson() => {};
}
