import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'models.freezed.dart';
part 'models.g.dart';

{{#usecases}}// TODO(aqeeq): Modify, move or remove as needed
@freezed
class {{..pascalCase()}}ResponseModel with _${{..pascalCase()}}ResponseModel {
  const factory {{..pascalCase()}}ResponseModel({
    required String id,
    required String name,
  }) = _{{..pascalCase()}}ResponseModel;

  factory {{..pascalCase()}}ResponseModel.fromJson(Map<String, dynamic> json) =>
      _${{..pascalCase()}}ResponseModelFromJson(json);
}

extension {{..pascalCase()}}ResponseModelEx on {{..pascalCase()}}ResponseModel {
  {{..pascalCase()}}Response toEntity() => {{..pascalCase()}}Response(
    id: id,
    name: name,
  );
}
{{/usecases}}
{{#paginated_usecases}}// TODO(aqeeq): Modify, move or remove as needed
@freezed
class {{..pascalCase()}}ResponseModel with _${{..pascalCase()}}ResponseModel {
  const factory {{..pascalCase()}}ResponseModel({
    required String id,
    required String name,
  }) = _{{..pascalCase()}}ResponseModel;

  factory {{..pascalCase()}}ResponseModel.fromJson(Map<String, dynamic> json) =>
      _${{..pascalCase()}}ResponseModelFromJson(json);
}

extension {{..pascalCase()}}ResponseModelEx on {{..pascalCase()}}ResponseModel {
  {{..pascalCase()}}Response toEntity() => {{..pascalCase()}}Response(
    id: id,
    name: name,
  );
}
{{/paginated_usecases}}
