// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      questionType: json['questionType'] as String,
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLocked: json['isLocked'] as bool,
      selectedAnswer: json['selectedAnswer'] == null
          ? null
          : Answer.fromJson(json['selectedAnswer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'questionType': instance.questionType,
      'question': instance.question,
      'answers': instance.answers,
      'isLocked': instance.isLocked,
      'selectedAnswer': instance.selectedAnswer,
    };
