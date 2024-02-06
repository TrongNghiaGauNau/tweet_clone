import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ui.freezed.dart';

part 'user_ui.g.dart';

@freezed
class UserUI with _$UserUI {
  const factory UserUI({
    required String name,
    required String profilePic,
    required String uid,
    @Default(false) bool isTwitterBlue,
  }) = _UserUI;

  factory UserUI.fromJson(Map<String, dynamic> json) => _$UserUIFromJson(json);
}
