part of '../app.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = {{name.pascalCase()}}Router.router(ref);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => context.strings.appName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: {{name.pascalCase()}}Theme.light(),
      darkTheme: {{name.pascalCase()}}Theme.dark(),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
