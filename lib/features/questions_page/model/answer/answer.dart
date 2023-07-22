import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  factory Answer({
    required String text,
    required bool isTrue,
  }) = _Answer;

  factory Answer.initialState() => Answer(text: '', isTrue: false);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
