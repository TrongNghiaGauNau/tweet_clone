import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui/user_ui.dart';
part 'user_ui_state.freezed.dart';

@freezed
class UserUIState with _$UserUIState {
  const UserUIState._();
  const factory UserUIState.init() = _UserUIInit;
  const factory UserUIState.data({required UserUI userUI}) = _UserUISuccess;
  const factory UserUIState.error() = _UserUIFailure;
  const factory UserUIState.loading() = _UserUILoading;
}
