import 'package:aquascaper_app/models/user_model.dart';
import 'package:aquascaper_app/services/extensions.dart';
import 'package:aquascaper_app/services/user_services.dart';
import 'package:aquascaper_app/utils/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(
      String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = result.user.convertToUser(
        name: name,
      );

      await UserServices.initUser(user);

      return SignInSignUpResult(user: user);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(message: e.message);
    }
  }

  static Future<SignInSignUpResult> signIn(
    String email,
    String password,
  ) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = await result.user.fromFireStore();

      return SignInSignUpResult(user: user);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseAuthExceptionCode.USER_NOT_FOUND) {
        return SignInSignUpResult(message: "Invalid email");
      }

      if (e.code == FirebaseAuthExceptionCode.WRONG_PASSWORD) {
        return SignInSignUpResult(message: "Invalid password");
      }

      return SignInSignUpResult(message: e.message);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<SignInSignUpResult> resetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  static Stream<User> get userStream => _auth.authStateChanges();

  static Future<SignInSignUpResult> inputData() {
    final User user = _auth.currentUser;
  }

  static Future<Result> changePassword({
    @required String currentPassword,
    @required String newPassword,
  }) async {
    try {
      final User user = _auth.currentUser;

      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email,
        password: currentPassword,
      );
      UserCredential result =
          await _auth.currentUser.reauthenticateWithCredential(credential);

      await result.user.updatePassword(newPassword);
      return Result.success();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == FirebaseAuthExceptionCode.WRONG_PASSWORD) {
        return Result.failed(message: "Invalid current password");
      }

      return Result.failed(message: e.message);
    }
  }
}

class SignInSignUpResult {
  final UserModel user;
  final String message;

  SignInSignUpResult({
    this.user,
    this.message,
  });
}

enum ResultState { success, failed }

class Result<T> {
  final ResultState state;
  final T data;
  final String message;

  Result(this.state, {this.data, this.message});

  factory Result.success({T data, String message}) => Result(
        ResultState.success,
        data: data,
        message: message,
      );

  factory Result.failed({String message}) => Result(
        ResultState.failed,
        message: message,
      );
}
