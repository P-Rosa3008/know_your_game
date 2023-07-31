import 'package:flutter/material.dart';
import 'package:know_your_game/utils/dummy/dummy_user.dart';
import 'package:know_your_game/utils/utils.dart';

class KygLeaderboard extends StatelessWidget {
  const KygLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: KygContainer(
        height: MediaQuery.of(context).size.width * 0.75,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KygListTile(user: dummyUser),
            KygListTile(user: dummyUser),
            KygListTile(user: dummyUser),
            KygListTile(user: dummyUser),
            KygListTile(user: dummyUser),
          ],
        ),
      ),
    );
  }
}
