import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui/user_ui.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/user_repository.dart';

class ChatMemberNotifier extends StateNotifier<List<UserUI>> {
  ChatMemberNotifier({required UserRepsitory userRepsitory})
      : _userRepsitory = userRepsitory,
        super([]);

  final UserRepsitory _userRepsitory;

  void getChatMembers(List<String> listUids) async {
    final List<UserUI> listUser = [];
    for (final uid in listUids) {
      final userUI = await _userRepsitory.getUserUIData(uid);
      if (userUI != null) {
        listUser.add(userUI);
      }
    }
    state = listUser;
  }
}
