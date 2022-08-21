import 'package:aquascaper_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future initUser(UserModel user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'temperature': 0,
      'ph': 0.0,
      'turbidity': 0,
      'ppm': 0,
    });
  }

  static Future updateUserProfile(UserModel user) async {
    _userCollection.doc(user.id).update({
      'email': user.email,
      'name': user.name,
    });
  }

  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return UserModel(
      id,
      snapshot.data()['email'],
      name: snapshot.data()['name'],
      temperature: snapshot.data()['temperature'],
      ph: snapshot.data()['ph'],
      turbidity: snapshot.data()['turbidity'],
      ppm: snapshot.data()['ppm'],
    );
  }

  static Stream<UserModel> getUserStream(String id) =>
      _userCollection.doc(id).snapshots().map((snapshot) => UserModel(
        id,
            snapshot.data()['email'],
            name: snapshot.data()['name'],
            temperature: snapshot.data()['temperature'],
            ph: snapshot.data()['ph'],
            turbidity: snapshot.data()['turbidity'],
            ppm: snapshot.data()['ppm'],
          ));
}
