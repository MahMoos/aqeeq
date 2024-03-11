part of '../models.dart';

class User {
  const User({
    required this.id,
    this.isAnonymous = false,
    this.refreshToken,
    this.name,
    this.email,
    this.photoUrl,
    this.phoneNumber,
  });

  final String id;
  final bool isAnonymous;
  final String? refreshToken;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? phoneNumber;

  {{#useFirebaseAuth}}static User? fromFirebaseUser(firebase.User? firebaseUser) {
    return firebaseUser != null
        ? User(
            id: firebaseUser.uid,
            isAnonymous: firebaseUser.isAnonymous,
            refreshToken: firebaseUser.refreshToken,
            name: firebaseUser.displayName,
            email: firebaseUser.email,
            photoUrl: firebaseUser.photoURL,
            phoneNumber: firebaseUser.phoneNumber,
          )
        : null;
  }{{/useFirebaseAuth}}

  {{#useAmplifyAuth}}static User? fromAmplifyUser(
    CognitoAuthSession authSession,
    List<AuthUserAttribute> userAttributes,
  ) {
    if (authSession.isSignedIn) {
      final givenName =
          userAttributes.getUserAttribute(AuthUserAttributeKey.givenName);
      final familyName =
          userAttributes.getUserAttribute(AuthUserAttributeKey.familyName);
      return User(
        id: authSession.identityIdResult.value,
        refreshToken: authSession.userPoolTokensResult.value.refreshToken,
        name: '${givenName != null ? '$givenName ' : ''}${familyName ?? ''}',
        email: userAttributes.getUserAttribute(AuthUserAttributeKey.email),
        photoUrl: userAttributes.getUserAttribute(AuthUserAttributeKey.picture),
        phoneNumber:
            userAttributes.getUserAttribute(AuthUserAttributeKey.phoneNumber),
      );
    } else {
      return null;
    }
  }{{/useAmplifyAuth}}
}
