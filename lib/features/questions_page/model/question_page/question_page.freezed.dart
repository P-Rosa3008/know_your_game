// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionPage _$QuestionPageFromJson(Map<String, dynamic> json) {
  return _QuestionPage.fromJson(json);
}

/// @nodoc
mixin _$QuestionPage {
  List<Question> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionPageCopyWith<QuestionPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionPageCopyWith<$Res> {
  factory $QuestionPageCopyWith(
          QuestionPage value, $Res Function(QuestionPage) then) =
      _$QuestionPageCopyWithImpl<$Res, QuestionPage>;
  @useResult
  $Res call({List<Question> questions});
}

/// @nodoc
class _$QuestionPageCopyWithImpl<$Res, $Val extends QuestionPage>
    implements $QuestionPageCopyWith<$Res> {
  _$QuestionPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionPageCopyWith<$Res>
    implements $QuestionPageCopyWith<$Res> {
  factory _$$_QuestionPageCopyWith(
          _$_QuestionPage value, $Res Function(_$_QuestionPage) then) =
      __$$_QuestionPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Question> questions});
}

/// @nodoc
class __$$_QuestionPageCopyWithImpl<$Res>
    extends _$QuestionPageCopyWithImpl<$Res, _$_QuestionPage>
    implements _$$_QuestionPageCopyWith<$Res> {
  __$$_QuestionPageCopyWithImpl(
      _$_QuestionPage _value, $Res Function(_$_QuestionPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
  }) {
    return _then(_$_QuestionPage(
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionPage implements _QuestionPage {
  _$_QuestionPage({required final List<Question> questions})
      : _questions = questions;

  factory _$_QuestionPage.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionPageFromJson(json);

  final List<Question> _questions;
  @override
  List<Question> get questions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuestionPage(questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionPage &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionPageCopyWith<_$_QuestionPage> get copyWith =>
      __$$_QuestionPageCopyWithImpl<_$_QuestionPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionPageToJson(
      this,
    );
  }
}

abstract class _QuestionPage implements QuestionPage {
  factory _QuestionPage({required final List<Question> questions}) =
      _$_QuestionPage;

  factory _QuestionPage.fromJson(Map<String, dynamic> json) =
      _$_QuestionPage.fromJson;

  @override
  List<Question> get questions;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionPageCopyWith<_$_QuestionPage> get copyWith =>
      throw _privateConstructorUsedError;
}
