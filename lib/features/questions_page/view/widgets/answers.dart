import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:know_your_game/features/questions_page/model/answer/answer.dart';
import 'package:know_your_game/features/questions_page/model/model.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../utils/utils.dart';

final isAnswerTrueProvider = StateProvider((ref) => false);

class AnswersWidget extends ConsumerWidget {
  final Question question;
  final ValueChanged<Answer> onClickedAnswer;

  const AnswersWidget({
    super.key,
    required this.question,
    required this.onClickedAnswer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ItemScrollController itemScrollController = ItemScrollController();

    Color getColorForAnswer(Answer answer, Question question) {
      final isSelected = answer == question.selectedAnswer;
      if (question.isLocked) {
        if (isSelected) {
          return answer.isTrue ? ColorsUiTheme.mainGreen : Colors.red;
        } else if (answer.isTrue) {
          return ColorsUiTheme.mainGreen;
        }
      }
      return ColorsUiTheme.mainBorder;
    }

    Widget getIconForAnswer(Answer answer, Question question) {
      final isSelected = answer == question.selectedAnswer;
      if (question.isLocked) {
        if (isSelected) {
          return answer.isTrue
              ? const Icon(
                  Icons.check_circle_rounded,
                  color: ColorsUiTheme.mainGreen,
                )
              : const Icon(
                  Icons.cancel,
                  color: Colors.red,
                );
        } else if (answer.isTrue) {
          return const Icon(
            Icons.check_circle_rounded,
            color: ColorsUiTheme.mainGreen,
          );
        }
      }
      return const SizedBox.shrink();
    }

    Widget _buildAnswer(BuildContext context, List<Answer> answers, int index) {
      final borderColor = getColorForAnswer(answers[index], question);

      return KygButton(
        key: Key('answer_kyg_button_widget'),
        borderColor: borderColor,
        onTap: () {
          onClickedAnswer(answers[index]);
          itemScrollController.scrollTo(
            // alignment: 8,
            index: question.answers.indexWhere(
              (answer) => answer.isTrue == true,
            ),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOutSine,
          );
          if (question.answers[index].isTrue) {
            ref.read(isAnswerTrueProvider.notifier).state = true;
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                answers[index].text,
                style: textTheme.bodyLarge,
              ),
            ),
            getIconForAnswer(answers[index], question),
          ],
        ),
      );
    }

    return ScrollablePositionedList.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: question.answers.length,
      itemScrollController: itemScrollController,
      itemBuilder: (context, index) => _buildAnswer(context, question.answers, index),
    );
  }
}
