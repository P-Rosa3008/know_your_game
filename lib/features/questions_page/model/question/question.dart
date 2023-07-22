import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:know_your_game/features/questions_page/model/answer/answer.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@unfreezed
class Question with _$Question {
  factory Question({
    required String questionType,
    required String question,
    required List<Answer> answers,
    required bool isLocked,
    Answer? selectedAnswer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  factory Question.initialState() => Question(
        questionType: '',
        question: '',
        answers: [],
        isLocked: true,
      );
}
