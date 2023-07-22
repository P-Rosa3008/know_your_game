// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionPage _$$_QuestionPageFromJson(Map<String, dynamic> json) =>
    _$_QuestionPage(
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionPageToJson(_$_QuestionPage instance) =>
    <String, dynamic>{
      'questions': instance.questions,
    };
