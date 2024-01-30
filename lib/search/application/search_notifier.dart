import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/search/infrastructure/models/search_state.dart';
import 'package:twitter_clone_2/search/infrastructure/search_repository.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';

class SearchNotifier extends StateNotifier<SearchState<List<User>>> {
  SearchNotifier(this._repo) : super(const SearchState.init());
  final SearchRepository _repo;

  FutureEither<List<User>> searchUser(String input) async {
    state = const SearchState.loading();
    try {
      List<User> searchList = [];
      final res = await _repo.searchUser(input);
      res.fold((l) {
        debugPrint(l.messsage);
        // state = const SearchState.failure();
        return left(l.messsage);
      }, (r) {
        if (r.isEmpty) {
          state = const SearchState.empty();
        } else {
          searchList = r;
          state = SearchState.data(data: r);
        }
      });
      return right(searchList);
    } catch (e, stackTrace) {
      final failure = Failure(e.toString(), stackTrace);
      state = SearchState.error(failure: failure, data: []);
      return left(failure);
    }
  }
}
