import 'package:flutter/material.dart';
import 'package:know_your_game/utils/utils.dart';

class QuestionsPageLoading extends StatelessWidget {
  const QuestionsPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Estamos a carregar as perguntas...',
            style: textTheme.titleSmall,
          ),
          SizedBox(
            height: 8,
          ),
          CircularProgressIndicator(
            color: Colors.black87,
          )
        ],
      ),
    );
  }
}
