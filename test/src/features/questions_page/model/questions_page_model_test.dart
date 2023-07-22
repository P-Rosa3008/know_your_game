import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:know_your_game/features/questions_page/model/model.dart';

import '../../../../test_helper/mocks/questions_page_mocks.dart';

void main() {
  test('Should return correct initial state for QuestionPage', () {
    final expectedModel = QuestionPage.initialState();

    expect(expectedModel.questions.isEmpty, true);
  });

  test('Should transform QuestionPage from JSON', () {
    final result = QuestionPage.fromJson(mockQuestionsPageJson);
    expect(result, TypeMatcher<QuestionPage>());
  });

  test('Should transform QuestionPage to JSON', () {
    final result = json.encode(mockQuestionPageModel);
    expect(result, mockQuestionPageStringJson);
  });
}
