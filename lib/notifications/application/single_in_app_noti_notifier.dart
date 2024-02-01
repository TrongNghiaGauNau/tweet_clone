import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

class SingleNotiInAppNotifier extends StateNotifier<User?> {
  SingleNotiInAppNotifier(this.ref) : super(null);
  final Ref ref;

  FutureVoid getUserInfoDetail(String uid) async {
    final user =
        await ref.watch(userControllerProvider.notifier).getUserDetailInfo(uid);
    state = user;
  }
}
