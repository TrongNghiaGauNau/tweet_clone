import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

part 'auth_state.g.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.init() = _AuthInit;
  const factory AuthState.success() = _AuthSuccess;
  const factory AuthState.failure() = _AuthFailure;
  const factory AuthState.loading() = _AuthLoading;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
