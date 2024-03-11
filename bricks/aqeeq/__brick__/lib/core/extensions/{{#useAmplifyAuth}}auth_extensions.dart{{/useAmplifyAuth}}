part of 'extensions.dart';

extension AuthUserAttributesExtension on List<AuthUserAttribute> {
  String? getUserAttribute(AuthUserAttributeKey key) {
    return firstWhereOrNull((attr) => attr.userAttributeKey == key)?.value;
  }
}
