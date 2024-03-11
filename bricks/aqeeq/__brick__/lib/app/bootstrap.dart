part of 'app.dart';

class Logger extends ProviderObserver {
  const Logger();

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      '''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''',
      name: 'Riverpod Observer',
    );
  }
}

{{#useAmplifyAuth}}Future<void> _configureAmplify() async {
  try {
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);

    // call Amplify.configure to use the initialized categories in your app
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e, stack) {
    log('An error occurred configuring Amplify: $e', stackTrace: stack);
  }
}{{/useAmplifyAuth}}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  {{#useAmplifyAuth}}await _configureAmplify();{{/useAmplifyAuth}}
  {{#useFirebaseAuth}}await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);{{/useFirebaseAuth}}
  runApp(ProviderScope(observers: const [Logger()], child: await builder()));
}
