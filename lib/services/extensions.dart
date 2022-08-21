import 'package:aquascaper_app/models/user_model.dart';
import 'package:aquascaper_app/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserExtension on User {
  UserModel convertToUser({
    String name = "No Name",
  }) =>
      UserModel(
        this.uid,
        this.email,
        name: name,
      );

  Future<UserModel> fromFireStore() async =>
      await UserServices.getUser(this.uid);
}
