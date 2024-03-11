part of 'widgets.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    required this.name,
    super.key,
    this.photoUrl,
    this.bio,
  });

  final String? photoUrl;
  final String name;
  final String? bio;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      leading: UserAvatar(photoUrl: photoUrl, name: name),
      title: Text(name),
      subtitle: Text(
        bio ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
