import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/auth/application/authenticator.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui/user_ui.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui_state/user_ui_state.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/user_repository.dart';

class UserUINotifier extends StateNotifier<UserUIState> {
  UserUINotifier({
    required UserRepsitory userRepo,
    required Authenticator authenticator,
  })  : _userRepo = userRepo,
        _authenticator = authenticator,
        super(const UserUIState.init());
  final UserRepsitory _userRepo;
  final Authenticator _authenticator;

  Future<UserUI?> getUserUIlInfo(String uid) async {
    state = const UserUIState.loading();
    try {
      final user = await _userRepo.getUserUIData(uid);
      if (user != null) {
        state = UserUIState.data(userUI: user);
        return user;
      } else {
        state = const UserUIState.error();
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      state = const UserUIState.error();
      return null;
    }
  }

  Future<UserUI?> getCurrentUserUIlInfo() async {
    final currentUID = _authenticator.currentUser?.uid;
    if (currentUID == null) return null;
    final res = await getUserUIlInfo(currentUID);
    return res;
  }
}
