part of 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  String? _accessToken;

  // User? _currentUser;

  firebase.FirebaseAuth get instance => firebase.FirebaseAuth.instance;

  @override
  User? get currentUser => User.fromFirebaseUser(instance.currentUser);

  @override
  Future<String?> get accessToken async => _accessToken;

  @override
  String? get refreshToken =>
      firebase.FirebaseAuth.instance.currentUser?.refreshToken;

  @override
  Future<String?> renewToken() async {
    final user = firebase.FirebaseAuth.instance.currentUser;
    if (user != null) return user.getIdToken(true);
    _accessToken = null;
    return null;
  }

  Future<User?> signInAnonymously() async {
    await firebase.FirebaseAuth.instance.signInAnonymously();
    _accessToken =
        await firebase.FirebaseAuth.instance.currentUser?.getIdToken();
    return User.fromFirebaseUser(firebase.FirebaseAuth.instance.currentUser);
  }

  @override
  Future<User?> signInWithProvider(AuthProviders provider) async {
    final firebaseProvider = _firebaseProviderOf(provider);
    if (firebaseProvider != null) {
      await firebase.FirebaseAuth.instance.signInWithProvider(firebaseProvider);
      _accessToken =
          await firebase.FirebaseAuth.instance.currentUser?.getIdToken();
      return User.fromFirebaseUser(firebase.FirebaseAuth.instance.currentUser);
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await firebase.FirebaseAuth.instance.signOut();
    _accessToken = null;
  }

  firebase.AuthProvider? _firebaseProviderOf(AuthProviders provider) {
    switch (provider) {
      case AuthProviders.google:
        return firebase.GoogleAuthProvider();
      case AuthProviders.facebook:
        return firebase.FacebookAuthProvider();
      case AuthProviders.apple:
        return firebase.AppleAuthProvider();
      case AuthProviders.github:
        return firebase.GithubAuthProvider();
      case AuthProviders.twitter:
        return firebase.TwitterAuthProvider();
      case AuthProviders.microsoft:
        return firebase.OAuthProvider('microsoft.com');
      case AuthProviders.yahoo:
        return firebase.OAuthProvider('yahoo.com');
      case AuthProviders.phone:
        return firebase.PhoneAuthProvider();
    }
  }
}
