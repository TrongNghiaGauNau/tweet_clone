import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/search/application/search_notifier.dart';
import 'package:twitter_clone_2/search/infrastructure/models/search_state.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState<List<User>>>((ref) {
  return SearchNotifier(ref.watch(searchRepositoryProvider));
});

final searchKeyProvider = StateProvider<String>((ref) {
  return '';
});
