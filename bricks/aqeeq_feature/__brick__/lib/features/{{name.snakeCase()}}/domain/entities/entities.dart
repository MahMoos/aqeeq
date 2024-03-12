import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';

{{#usecases}}// TODO(aqeeq): Modify, move or remove as needed
@freezed
class {{..pascalCase()}}Response with _${{..pascalCase()}}Response {
  const factory {{..pascalCase()}}Response({
    required String id,
    required String name,
  }) = _{{..pascalCase()}}Response;
}
{{/usecases}}
{{#paginated_usecases}}// TODO(aqeeq): Modify, move or remove as needed
@freezed
class {{..pascalCase()}}Response with _${{..pascalCase()}}Response {
  const factory {{..pascalCase()}}Response({
    required String id,
    required String name,
  }) = _{{..pascalCase()}}Response;
}
{{/paginated_usecases}}
