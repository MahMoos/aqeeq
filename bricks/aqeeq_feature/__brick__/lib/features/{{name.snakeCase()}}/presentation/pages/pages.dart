import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../controllers/controllers.dart';
import '../widgets/widgets.dart';

part '{{name.snakeCase()}}_page.dart';
{{#paginated_usecases}}
// TODO(aqeeq): Modify, move or remove as needed
class {{..pascalCase()}}Page extends StatelessWidget {
  const {{..pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return EndlessAnimatedListView(
      provider: {{..camelCase()}}ControllerProvider(),
      sliverAppBar: SliverAppBar(
        title: Text(context.strings.{{name.camelCase()}}),
      ),
      builder: (context, data) {
        return {{name.pascalCase()}}Card(
          label: data.name,
        ).paddingSymmetric(horizontal: 12, vertical: 4);
      },
    );
  }
}
{{/paginated_usecases}}
