import '../model/model.dart';

abstract class QuestionPageRepository {
  Future<QuestionPage> retrieveQuestionPage();
}
