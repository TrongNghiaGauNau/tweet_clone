import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/auth/application/authenticator.dart';
import 'package:twitter_clone_2/auth/infrastructure/models/auth_state.dart';
import 'package:twitter_clone_2/auth/presentation/login/login_screen.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/user_repository.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart'
    as model;

class AuthController extends StateNotifier<AuthState> {
  AuthController(this._authenticator, this._userRepsitory)
      : super(const AuthState.init());

  final Authenticator _authenticator;
  final UserRepsitory _userRepsitory;

  void signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = const AuthState.loading();
    try {
      //sign up in authenticator
      final respond = await _authenticator.signUpWithEmailAndPassword(
          email: email, password: password);
      respond.fold((l) => showSnackbar(context, l.messsage), (r) async {
        //save user data just signed up to firestore
        final user = model.User(
            email: email,
            name: getNameFromEmail(email),
            followers: const [],
            following: const [],
            profilePic: '',
            bannerPic: '',
            uid: r,
            bio: '',
            isTwitterBlue: false);
        final res = await _userRepsitory.saveUserData(user, r);
        res.fold((l) => showSnackbar(context, l.messsage), (r) {
          showSnackbar(context, 'Account created sucessfully! Please login');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginView(),
          ));
        });
      });
      state = const AuthState.init();
    } catch (e) {
      state = const AuthState.failure();
    }
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = const AuthState.loading();
    try {
      final respond = await _authenticator.logInWithEmailAndPassword(
          email: email, password: password);
      respond.fold((l) {
        showSnackbar(context, l.messsage);
        state = const AuthState.failure();
      }, (r) {
        state = const AuthState.success();
      });
    } catch (e) {
      state = const AuthState.failure();
      debugPrint(e.toString());
    }
  }

  void logout(BuildContext context) async {
    try {
      final res = await _authenticator.logOut();
      res.fold((l) => showSnackbar(context, l.messsage),
          (r) => state = const AuthState.failure());
    } catch (e) {
      debugPrint('Error Logout: $e');
    }
  }

  Future<model.User?> getUserData(String uid) async {
    try {
      final user = await _userRepsitory.getUserData(uid);
      if (user != null) {
        return user;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
