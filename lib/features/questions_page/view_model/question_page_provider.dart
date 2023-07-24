import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:know_your_game/features/questions_page/model/question_page/question_page.dart';
import 'package:know_your_game/features/questions_page/repository/question_page_repository.dart';
import 'package:know_your_game/features/questions_page/repository/question_page_repository_impl.dart';

final questionPageProvider = StateNotifierProvider<QuestionPageProvider, AsyncValue<QuestionPage>>(
  (ref) => QuestionPageProvider(ref.watch(questionPageRepository)),
);

class QuestionPageProvider extends StateNotifier<AsyncValue<QuestionPage>> {
  final QuestionPageRepository _questionPageRepository;

  QuestionPageProvider(this._questionPageRepository) : super(AsyncValue.data(QuestionPage.initialState()));

  Future<void> retrieveQuestionPage({int? law}) async {
    try {
      state = const AsyncLoading();
      final questionPage = await _questionPageRepository.retrieveQuestionPage(law: law);
      state = AsyncValue.data(questionPage);
    } catch (exception, stackTrace) {
      state = AsyncValue.error(exception, stackTrace);
    }
  }
}
