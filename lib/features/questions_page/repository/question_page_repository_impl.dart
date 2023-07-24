import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/http_util.dart';
import '../model/model.dart';
import 'question_page_repository.dart';

part 'question_page_repository_impl.g.dart';

final questionPageRepository = Provider(
  (ref) => QuestionPageRepositoryImpl(
    ref.watch(dioProvider),
  ),
);

@RestApi()
abstract class QuestionPageRepositoryImpl implements QuestionPageRepository {
  factory QuestionPageRepositoryImpl(Dio dio) = _QuestionPageRepositoryImpl;

  @GET('/api/questions')
  @override
  Future<QuestionPage> retrieveQuestionPage({@Query("law") int? law});
}
