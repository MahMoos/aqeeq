part of 'widgets.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key, this.body});

  final Widget? body;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
    );
  }
}
