import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String email,
    required String name,
    required List<String> followers,
    required List<String> following,
    required String profilePic,
    required String bannerPic,
    required String uid,
    required String bio,
    required bool isTwitterBlue,
    required String lastActive,
    required bool isOnline,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
