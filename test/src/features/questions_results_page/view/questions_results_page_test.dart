import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:know_your_game/features/questions_results_page/view/questions_results_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper/test_helper.dart';

void main() {
  final mockGoRouter = MockGoRouter();
  testWidgets('QuestionsResultPage shown when on right route', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: MockGoRouterProvider(goRouter: mockGoRouter, child: QuestionsResultsPage()),
        ),
      ),
    );

    expect(find.byKey(Key('questions_results_page_widget')), findsOneWidget);
  });

  testWidgets('QuestionsResultPage back button should route to MainPage when pressed', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: MockGoRouterProvider(goRouter: mockGoRouter, child: QuestionsResultsPage()),
        ),
      ),
    );

    await tester.tap(find.byKey(Key('back_button_widget')));
    await tester.pumpAndSettle();

    verify(() => mockGoRouter.go('/main')).called(1);
    verifyNever(() => mockGoRouter.go('/questions'));
  });
}
