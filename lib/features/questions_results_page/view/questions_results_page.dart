import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:know_your_game/features/questions_page/view/question_page.dart';
import 'package:know_your_game/utils/utils.dart';

class QuestionsResultsPage extends ConsumerWidget {
  const QuestionsResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: Key('questions_results_page_widget'),
      body: Center(
        child: GestureDetector(
          key: Key('back_button_widget'),
          onTap: (() {
            ref.invalidate(questionNumberProvider);
            context.go(RoutesEndpoints.main);
          }),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ColorsUiTheme.mainBorder,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                    color: ColorsUiTheme.mainBorder,
                    offset: const Offset(
                      0.0,
                      2.0,
                    ))
              ],
            ),
            child: Text(
              "Voltar",
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
