import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';

class SearchRepository {
  final _searchRepo = FirebaseFirestore.instance.collection('users');

  FutureEither<List<User>> searchUser(String input) async {
    try {
      final querySearch = await _searchRepo
          .where('name', isLessThanOrEqualTo: input.toLowerCase())
          .get();
      final result = querySearch.docs;
      final userList =
          result.map((user) => User.fromJson(user.data())).toList();

      return right(userList);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'search_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
