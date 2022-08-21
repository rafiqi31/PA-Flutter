import 'package:aquascaper_app/pages/auth/login_page.dart';
import 'package:aquascaper_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);

    if (firebaseUser != null) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
