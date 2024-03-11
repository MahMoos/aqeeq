part of '../models.dart';

mixin UseCase<Type, Params> {
  Future<Type> call(Params params);
}
