import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required int correctAnswers,
    required int wrongAnswers,
    required String avatarUrl,
    required int xp,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
