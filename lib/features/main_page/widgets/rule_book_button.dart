import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:know_your_game/utils/utils.dart';

class RuleBookButton extends StatelessWidget {
  const RuleBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return KygButton(
      onTap: () => context.go(RoutesEndpoints.pdfViewer),
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text('Leis do Jogo - IFAB', style: textTheme.bodyLarge),
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            top: 8,
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.rotationZ(
                3.1415926535897932 / 15,
              ),
              child: Image.asset(
                "assets/rule_book_icon.png",
                scale: 4,
              ),
            ),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
    );
  }
}
