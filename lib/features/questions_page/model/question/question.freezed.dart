// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String get questionType => throw _privateConstructorUsedError;
  set questionType(String value) => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  set question(String value) => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  set answers(List<Answer> value) => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError;
  set isLocked(bool value) => throw _privateConstructorUsedError;
  Answer? get selectedAnswer => throw _privateConstructorUsedError;
  set selectedAnswer(Answer? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {String questionType,
      String question,
      List<Answer> answers,
      bool isLocked,
      Answer? selectedAnswer});

  $AnswerCopyWith<$Res>? get selectedAnswer;
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionType = null,
    Object? question = null,
    Object? answers = null,
    Object? isLocked = null,
    Object? selectedAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedAnswer: freezed == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as Answer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnswerCopyWith<$Res>? get selectedAnswer {
    if (_value.selectedAnswer == null) {
      return null;
    }

    return $AnswerCopyWith<$Res>(_value.selectedAnswer!, (value) {
      return _then(_value.copyWith(selectedAnswer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionType,
      String question,
      List<Answer> answers,
      bool isLocked,
      Answer? selectedAnswer});

  @override
  $AnswerCopyWith<$Res>? get selectedAnswer;
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionType = null,
    Object? question = null,
    Object? answers = null,
    Object? isLocked = null,
    Object? selectedAnswer = freezed,
  }) {
    return _then(_$_Question(
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedAnswer: freezed == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as Answer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Question implements _Question {
  _$_Question(
      {required this.questionType,
      required this.question,
      required this.answers,
      required this.isLocked,
      this.selectedAnswer});

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  String questionType;
  @override
  String question;
  @override
  List<Answer> answers;
  @override
  bool isLocked;
  @override
  Answer? selectedAnswer;

  @override
  String toString() {
    return 'Question(questionType: $questionType, question: $question, answers: $answers, isLocked: $isLocked, selectedAnswer: $selectedAnswer)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  factory _Question(
      {required String questionType,
      required String question,
      required List<Answer> answers,
      required bool isLocked,
      Answer? selectedAnswer}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  String get questionType;
  set questionType(String value);
  @override
  String get question;
  set question(String value);
  @override
  List<Answer> get answers;
  set answers(List<Answer> value);
  @override
  bool get isLocked;
  set isLocked(bool value);
  @override
  Answer? get selectedAnswer;
  set selectedAnswer(Answer? value);
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
