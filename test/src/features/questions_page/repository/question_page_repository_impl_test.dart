import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:know_your_game/features/questions_page/repository/question_page_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../test_helper/test_helper.dart';

class MockQuestionPageRepository extends Mock implements QuestionPageRepositoryImpl {}

class MockDio extends Mock implements Dio {}

void main() {
  late MockQuestionPageRepository mockQuestionPageRepository;
  late QuestionPageRepositoryImpl questionPageRepositoryImpl;
  late DioAdapter dioAdapter;
  late Provider<Dio> dioProvider;

  setUp(() {
    mockQuestionPageRepository = MockQuestionPageRepository();
    dioProvider = DioMock.createMock();
    dioAdapter = DioMock.dioAdapter;

    questionPageRepositoryImpl = QuestionPageRepositoryImpl(ProviderContainer(
      overrides: [questionPageRepository.overrideWithValue(mockQuestionPageRepository)],
    ).read(dioProvider));
  });

  test('QuestionPageRepositoryImpl should return the correct type', () {
    final provider = ProviderContainer().read(questionPageRepository);
    expect(provider, isA<QuestionPageRepositoryImpl>());
  });

  test('QuestionPageRepositoryImpl should retrieve QuestionPage object when success call retrieveQuestionPage',
      () async {
    dioAdapter.onGet(
      '/api/questions',
      (server) {
        server.reply(
          200,
          mockQuestionPageModel,
          delay: const Duration(seconds: 1),
        );
      },
      data: Matchers.any,
    );

    final result = await questionPageRepositoryImpl.retrieveQuestionPage();
    expect(result.toString(), mockQuestionPageModel.toString());
  });

  test('QuestionPageRepositoryImpl should throw exception when call retrieveQuestionPage', () async {
    dioAdapter.onGet(
      '/api/questions',
      (server) => server.reply(
        500,
        DioError(
          response: Response(
            data: 'any_data',
            statusCode: 500,
            requestOptions: RequestOptions(path: 'any_path'),
          ),
          requestOptions: RequestOptions(path: 'any_path'),
        ),
        delay: const Duration(seconds: 1),
      ),
      data: Matchers.any,
    );

    final result = questionPageRepositoryImpl.retrieveQuestionPage();

    expect(
      result,
      throwsA(const TypeMatcher<Exception>()),
    );
  });
}
