import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/auth/application/auth_notifier.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';

import '../infrastructure/models/auth_state.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(
      ref.watch(firebaseAuthProvider), ref.watch(userRepositoryProvider));
});

final userDetailsProvider = FutureProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

final currentUserDetailsProvider = FutureProvider((ref) {
  final currentUser = ref.watch(firebaseAuthProvider).currentUser?.uid;
  final authController = ref.watch(authControllerProvider.notifier);
  if (currentUser == null) return null;
  return authController.getUserData(currentUser);
});
