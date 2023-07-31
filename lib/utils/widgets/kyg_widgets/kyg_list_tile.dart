import 'package:flutter/material.dart';
import 'package:know_your_game/utils/user/model/user.dart';
import 'package:know_your_game/utils/utils.dart';

class KygListTile extends StatelessWidget {
  const KygListTile({super.key, required this.user, this.dense});

  final bool? dense;

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatarUrl),
      ),
      dense: dense ?? true,
      title: Text(user.username, style: textTheme.labelLarge),
      trailing: Text(user.xp.toString() + 'xp', style: textTheme.labelLarge),
    );
  }
}
