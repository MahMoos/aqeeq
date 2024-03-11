part of '../models.dart';

abstract class QueryParams {
  Map<String, dynamic> toJson();

  @override
  String toString() => toJson().entries.fold(
        '',
        (previousValue, element) => element.value != null
            ? '$previousValue&${element.key}=${element.value}'
            : previousValue,
      );
}
