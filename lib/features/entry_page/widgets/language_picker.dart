import 'package:flutter/material.dart';
import 'package:know_your_game/utils/widgets/flag_icons.dart';
import 'package:know_your_game/utils/widgets/language_picker_widget.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.5, bottom: 14.5),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              elevation: 0,
              context: context,
              builder: (context) => SizedBox(
                height: 185,
                child: Column(
                  children: [
                    LanguagePickerCardWidget(
                      flagAssetString: "assets/portugal_icon.png",
                      text: "Português",
                      available: true,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                    LanguagePickerCardWidget(
                      flagAssetString: "assets/united_kingdom_icon.png",
                      text: "Inglês (brevemente...)",
                      available: false,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                  ],
                ),
              ),
            );
          },
          child: FlagIcon("assets/portugal_icon.png"),
        ),
      ),
    );
  }
}
