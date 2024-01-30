import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';

class Authenticator {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  String get displayName => _firebaseAuth.currentUser?.displayName ?? '';

  String? get email => _firebaseAuth.currentUser?.email;

  //sign up with email and password
  FutureEither<String> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final String uid = userCredential.user!.uid;
      return right(uid);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'auth_api: ${e.message ?? 'Some unexpected error occurred'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  //log in with email and password
  FutureEither<UserCredential> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCreadential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(userCreadential);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'auth_api: ${e.message ?? 'Some unexpected error occurred'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  //log out
  FutureEitherVoid logOut() async {
    try {
      await _firebaseAuth.signOut();
      return right(null);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'auth_api: ${e.message ?? 'Some unexpected error occurred'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
