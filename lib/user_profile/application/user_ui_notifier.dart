import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui/user_ui.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui_state/user_ui_state.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/user_repository.dart';

class UserUINotifier extends StateNotifier<UserUIState> {
  UserUINotifier({
    required UserRepsitory userRepo,
  })  : _userRepo = userRepo,
        super(const UserUIState.init());
  final UserRepsitory _userRepo;

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
}
