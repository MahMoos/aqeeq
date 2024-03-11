part of 'auth_service.dart';

class AmplifyAuthService implements AuthService {
  Future<void> initialize() async {
    final authSession =
        await Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey)
            .fetchAuthSession();
    final userAttributes = await Amplify.Auth.fetchUserAttributes();
    _currentUser = User.fromAmplifyUser(authSession, userAttributes);
  }

  User? _currentUser;

  AmplifyClass get instance => Amplify;

  @override
  User? get currentUser => _currentUser;

  @override
  Future<String?> get accessToken async =>
      (await Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey)
              .fetchAuthSession())
          .credentialsResult
          .value
          .secretAccessKey;

  @override
  String? get refreshToken => currentUser?.refreshToken;

  @override
  Future<String?> renewToken() async {
    final results = await Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey)
        .fetchAuthSession(
      options: const FetchAuthSessionOptions(forceRefresh: true),
    );
    return results.isSignedIn
        ? results.userPoolTokensResult.value.accessToken.raw
        : null;
  }

  @override
  Future<User?> signInWithProvider(AuthProviders provider) async {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await Amplify.Auth.signOut();
  }
}
