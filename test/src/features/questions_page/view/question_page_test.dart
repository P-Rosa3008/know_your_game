import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:know_your_game/features/questions_page/repository/question_page_repository_impl.dart';
import 'package:know_your_game/features/questions_page/view/question_page.dart';
import 'package:know_your_game/features/questions_page/view/widgets/question.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper/test_helper.dart';
import '../repository/question_page_repository_impl_test.dart';

void main() {
  late QuestionPageRepositoryImpl mockQuestionPageRepositoryImpl;
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockQuestionPageRepositoryImpl = MockQuestionPageRepository();
    mockGoRouter = MockGoRouter();
  });

  testWidgets(
    'QuestionPageScreen should present all widgets correctly',
    (tester) async {
      when(
        () => mockQuestionPageRepositoryImpl.retrieveQuestionPage(),
      ).thenAnswer((_) async => mockQuestionPageModel);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            questionPageRepository.overrideWithValue(mockQuestionPageRepositoryImpl),
          ],
          child: MaterialApp(
            home: MockGoRouterProvider(goRouter: mockGoRouter, child: QuestionPage()),
          ),
        ),
      );
      expect(find.byKey(Key('question_page_widget')), findsOneWidget);
    },
  );

  testWidgets(
    'QuestionPageScreen should present loading state widget correctly',
    (tester) async {
      when(
        () => mockQuestionPageRepositoryImpl.retrieveQuestionPage(),
      ).thenAnswer((_) async {
        await Future<void>.delayed(const Duration(seconds: 3));
        return mockQuestionPageModel;
      });
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            questionPageRepository.overrideWithValue(mockQuestionPageRepositoryImpl),
          ],
          child: MaterialApp(
            home: MockGoRouterProvider(goRouter: mockGoRouter, child: QuestionPage()),
          ),
        ),
      );

      await tester.pump();

      final loadingWidget = find.byKey(Key('question_page_loading_widget'));

      expectSync(loadingWidget, findsOneWidget);

      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'QuestionPageScreen should present error widgets when an exception is thrown',
    (tester) async {
      when(
        () => mockQuestionPageRepositoryImpl.retrieveQuestionPage(),
      ).thenThrow(DioError(requestOptions: RequestOptions(path: '')));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            questionPageRepository.overrideWithValue(mockQuestionPageRepositoryImpl),
          ],
          child: MaterialApp(
            home: MockGoRouterProvider(goRouter: mockGoRouter, child: QuestionPage()),
          ),
        ),
      );

      await tester.pump();

      final errorWidget = find.byKey(Key('question_page_error_widget'));

      expectSync(errorWidget, findsOneWidget);

      await tester.pumpAndSettle();
    },
  );

  // testWidgets(
  //   'QuestionPageScreen should show correct answer when tapped',
  //   (tester) async {
  //     when(
  //       () => mockQuestionPageRepositoryImpl.retrieveQuestionPage(),
  //     ).thenAnswer((_) async => mockQuestionPageModelWithQuestions);
  //     final PageController controller = PageController();

  //     await tester.pumpWidget(
  //       ProviderScope(
  //         overrides: [
  //           questionPageRepository.overrideWithValue(mockQuestionPageRepositoryImpl),
  //         ],
  //         child: MaterialApp(
  //           home: MockGoRouterProvider(goRouter: mockGoRouter, child: QuestionPage()),
  //         ),
  //       ),
  //     );
  //     expect(find.byKey(Key('question_column_widget')), findsOneWidget);
  //   },
  // );

  testWidgets(
    'QuestionPageScreen should show all widgets when questions exists',
    (tester) async {
      when(
        () => mockQuestionPageRepositoryImpl.retrieveQuestionPage(),
      ).thenAnswer((_) async => mockQuestionPageModelWithQuestions);
      final PageController controller = PageController();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            questionPageRepository.overrideWithValue(mockQuestionPageRepositoryImpl),
          ],
          child: MaterialApp(
            home: MockGoRouterProvider(
              goRouter: mockGoRouter,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mockQuestionPageModelWithQuestions.questions.length,
                  controller: controller,
                  itemBuilder: (context, index) {
                    final _question = mockQuestionPageModelWithQuestions.questions[index];

                    return QuestionWidget(question: _question, data: mockQuestionPageModelWithQuestions.questions);
                  },
                ),
              ),
            ),
          ),
        ),
      );
      expect(find.byKey(Key('answer_widget')), findsOneWidget);
      expect(find.byKey(Key('question_widget')), findsOneWidget);
      expect(find.byKey(Key('answer_kyg_button_widget')), findsWidgets);
    },
  );

  testWidgets(
    'QuestionPageScreen should show all widgets when questions exists',
    (tester) async {
      when(
        () => mockQuestionPageRepositoryImpl.retrieveQuestionPage(),
      ).thenAnswer((_) async => mockQuestionPageModelWithQuestions);
      final PageController controller = PageController();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            questionPageRepository.overrideWithValue(mockQuestionPageRepositoryImpl),
          ],
          child: MaterialApp(
            home: MockGoRouterProvider(
              goRouter: mockGoRouter,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mockQuestionPageModelWithQuestions.questions.length,
                  controller: controller,
                  itemBuilder: (context, index) {
                    final _question = mockQuestionPageModelWithQuestions.questions[index];

                    return QuestionWidget(question: _question, data: mockQuestionPageModelWithQuestions.questions);
                  },
                ),
              ),
            ),
          ),
        ),
      );

      final answersButtons = find.byKey(Key('answer_widget'));
      final correctAnswer = 'Sample Correct Answer Text';
      await tester.tap(answersButtons);
      expect(answersButtons.at(0), correctAnswer);
    },
  );
}
