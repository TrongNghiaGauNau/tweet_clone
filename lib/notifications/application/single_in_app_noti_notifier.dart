import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui/user_ui.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui_state/user_ui_state.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/user_repository.dart';

class SingleNotiInAppNotifier extends StateNotifier<UserUI?> {
  SingleNotiInAppNotifier({this.userUI}) : super(userUI);
  final UserUI? userUI;
}
