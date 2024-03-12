part of 'pages.dart';

class {{name.pascalCase()}}Page extends ConsumerStatefulWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  ConsumerState<{{name.pascalCase()}}Page> createState() => _{{name.pascalCase()}}PageState();
}

class _{{name.pascalCase()}}PageState extends ConsumerState<{{name.pascalCase()}}Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Text('{{name.titleCase()}}'),
            ),
            body: SizedBox(
              width: double.maxFinite,
              child: ref.watch({{name.camelCase()}}ControllerProvider).when(
                    data: (data) => ListTile(title: data.name),
                    error: (err, stack) => StatusView.anErrorOccurred(
                      action: () =>
                          ref.refresh({{name.camelCase()}}ControllerProvider.future),
                    ),
                    loading: StatusView.loading,
                  ),
            ),
          );
  }
}
