part of 'widgets.dart';

class {{name.pascalCase()}}Card extends StatelessWidget {
  const {{name.pascalCase()}}Card({required this.label, super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
    );
  }
}
