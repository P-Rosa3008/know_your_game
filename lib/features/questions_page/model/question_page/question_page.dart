import 'package:freezed_annotation/freezed_annotation.dart';

import '../question/question.dart';

part 'question_page.freezed.dart';
part 'question_page.g.dart';

@freezed
class QuestionPage with _$QuestionPage {
  factory QuestionPage({required List<Question> questions}) = _QuestionPage;

  factory QuestionPage.fromJson(Map<String, dynamic> json) => _$QuestionPageFromJson(json);

  factory QuestionPage.initialState() => QuestionPage(
        questions: [],
      );
}
