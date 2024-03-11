import 'dart:core';

{{#useAmplifyAuth}}import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';import 'package:amplify_flutter/amplify_flutter.dart';{{/useAmplifyAuth}}{{#useFirebaseAuth}}import 'package:firebase_auth/firebase_auth.dart' as firebase;{{/useFirebaseAuth}}
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/models.dart';

{{#useAmplifyAuth}}part 'amplify_auth_service.dart';{{/useAmplifyAuth}}
part 'auth_service.g.dart';
{{#useFirebaseAuth}}part 'firebase_auth_service.dart';{{/useFirebaseAuth}}

@Riverpod(keepAlive: true)
Future<AuthService> authService(AuthServiceRef ref) async {
  {{#useAmplifyAuth}}final service = AmplifyAuthService();{{/useAmplifyAuth}}
  {{#useFirebaseAuth}}final service = FirebaseAuthService();{{/useFirebaseAuth}}
  {{^useFirebaseAuth}}{{^useAmplifyAuth}}//TODO: use an implementation of AuthService here instead
  final service = AuthService();{{/useAmplifyAuth}}{{/useFirebaseAuth}}
  await service.initialize();
  return service;
}

abstract class AuthService {
  User? get currentUser;

  Future<String?> get accessToken;

  String? get refreshToken;

  Future<String?> renewToken();

  Future<User?> signInWithProvider(AuthProviders provider);

  Future<void> signOut();
}
