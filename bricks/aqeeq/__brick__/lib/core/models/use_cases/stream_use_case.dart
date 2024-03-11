part of '../models.dart';

mixin StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}
