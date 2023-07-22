import 'package:flutter/material.dart';
import 'package:know_your_game/utils/utils.dart';
import 'package:know_your_game/utils/widgets/flag_icons.dart';

class LanguagePickerCardWidget extends StatelessWidget {
  const LanguagePickerCardWidget(
      {required this.flagAssetString, required this.text, required this.available, required this.onTap, super.key});

  final String flagAssetString;
  final String text;
  final bool available;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          children: [
            FlagIcon(flagAssetString),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                text,
                style: available ? textTheme.bodyText1 : textTheme.bodyText1?.copyWith(color: ColorsUiTheme.shadow),
              ),
            )
          ],
        ),
      ),
    );
  }
}
