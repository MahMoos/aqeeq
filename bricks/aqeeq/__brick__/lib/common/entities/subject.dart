part of 'entities.dart';

@freezed
class Subject with _$Subject {
  const factory Subject({
    required String id,
    required String name,
    String? description,
    String? imageUrl,
  }) = _Subject;
}
