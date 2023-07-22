import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:know_your_game/features/questions_page/model/model.dart';
import 'package:know_your_game/features/questions_page/repository/question_page_repository_impl.dart';
import 'package:know_your_game/features/questions_page/view_model/question_page_provider.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper/test_helper.dart';

class MockQuestionPageRepository extends Mock implements QuestionPageRepositoryImpl {}

void main() {
  late MockQuestionPageRepository mockQuestionPageRepository;
  late QuestionPageProvider mockQuestionPageProvider;
  late AsyncValue<QuestionPage> stateMock;

  setUp(() {
    mockQuestionPageRepository = MockQuestionPageRepository();
    mockQuestionPageProvider = QuestionPageProvider(mockQuestionPageRepository);
  });

  test('QuestionPageProvider should return correct type', () {
    final provider = ProviderContainer().read(questionPageProvider);

    expect(
      provider,
      isA<AsyncData<QuestionPage>>(),
    );
  });

  test('QuestionPageProvider should retrieve QuestionPage object when success call retrieveQuestionPage', () async {
    when(() => mockQuestionPageRepository.retrieveQuestionPage()).thenAnswer((_) async => mockQuestionPageModel);

    await mockQuestionPageProvider.retrieveQuestionPage();

    mockQuestionPageProvider.addListener((state) => stateMock = state);

    expect(stateMock.value, isA<QuestionPage>());
  });

  test('QuestionPageProvider should throw exception when call retrieveQuestionPage', () async {
    when(() => mockQuestionPageRepository.retrieveQuestionPage()).thenThrow(Exception());

    await mockQuestionPageProvider.retrieveQuestionPage();

    mockQuestionPageProvider.addListener((state) => stateMock = state);

    expect(stateMock.error, const TypeMatcher<Exception>());
  });
}
