import 'package:know_your_game/features/questions_page/model/answer/answer.dart';
import 'package:know_your_game/features/questions_page/model/model.dart';

const mockQuestionPageStringJson =
    '{"questions":[{"questionType":"","question":"","answers":[],"isLocked":true,"selectedAnswer":null}]}';

const mockQuestionsPageJson = {
  "questions": [
    {"questionType": "", "question": "", "answers": [], "isLocked": true}
  ]
};

final mockQuestionPageModel = QuestionPage(
  questions: [Question(questionType: '', question: '', answers: [], isLocked: true)],
);

final mockQuestionPageModelWithQuestions = QuestionPage(
  questions: [
    Question(
        questionType: 'random',
        question: 'Sample Question Text',
        answers: [
          Answer(text: 'Sample Wrong Answer Text', isTrue: false),
          Answer(text: 'Sample Wrong Answer Text', isTrue: false),
          Answer(text: 'Sample Correct Answer Text', isTrue: true),
          Answer(text: 'Sample Wrong Answer Text', isTrue: false),
        ],
        isLocked: false),
  ],
);
