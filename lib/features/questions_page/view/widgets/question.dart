import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:know_your_game/features/questions_page/model/model.dart';
import 'package:know_your_game/features/questions_page/view/question_page.dart';
import 'package:know_your_game/features/questions_page/view/widgets/answers.dart';
import 'package:know_your_game/utils/utils.dart';

class QuestionWidget extends ConsumerStatefulWidget {
  final Question question;
  final data;
  const QuestionWidget({super.key, required this.question, required this.data});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends ConsumerState<QuestionWidget> {
  Question get _question => widget.question;
  get _data => widget.data;

  @override
  Widget build(BuildContext context) {
    final questionNumber = ref.watch(questionNumberProvider);

    return Column(
      key: Key('question_widget'),
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _question.question,
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 16.0,
        ),
        Flexible(
          child: AnswersWidget(
            key: Key('answer_widget'),
            question: _question,
            onClickedAnswer: ((answer) {
              if (_question.isLocked) {
                return;
              } else {
                setState(() {
                  _question.isLocked = true;
                  _question.selectedAnswer = answer;
                });
                ref.read(isLockedProvider.notifier).state = _question.isLocked;
                if (questionNumber < _data.questions.length) {
                  ref.read(questionNumberProvider.notifier).state++;
                } else {}
                ref.read(firstTimeQuestionScreenProvider.notifier).state = false;
              }
            }),
          ),
        ),
      ],
    );
  }
}
