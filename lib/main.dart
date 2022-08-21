import 'package:aquascaper_app/models/user_model.dart';
import 'package:aquascaper_app/pages/auth/forgot_password_page.dart';
import 'package:aquascaper_app/pages/auth/login_page.dart';
import 'package:aquascaper_app/pages/auth/register_page.dart';
import 'package:aquascaper_app/pages/devices/phmeter.dart';
import 'package:aquascaper_app/pages/devices/ppm.dart';
import 'package:aquascaper_app/pages/devices/temperature.dart';
import 'package:aquascaper_app/pages/devices/turbidity.dart';
import 'package:aquascaper_app/pages/drawer/about_page.dart';
import 'package:aquascaper_app/pages/drawer/change_password_page.dart';
import 'package:aquascaper_app/pages/drawer/edit_profile_page.dart';
import 'package:aquascaper_app/pages/drawer/help_page.dart';
import 'package:aquascaper_app/pages/drawer/settings_page.dart';
import 'package:aquascaper_app/pages/home_page.dart';
import 'package:aquascaper_app/services/auth_services.dart';
import 'package:aquascaper_app/wrapper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'alert_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: Wrapper(),
        initialRoute: '/',
        routes: {
          '/home': (context) => HomePage(),
          '/about': (context) => AboutPage(),
          '/help': (context) => HelpPage(),
          '/settings': (context) => SettingsPage(),
          '/change': (context) => ChangePasswordPage(),
          '/edit': (context) => EditProfilePage(
                ModalRoute.of(context).settings.arguments as UserModel,
              ),
          '/tmp': (context) => suhu(),
          '/ppm': (context) => CO2(),
          '/tur': (context) => turbidity(),
          '/phm': (context) => pH(),
          '/fps': (context) => ForgotPasswordPage(),
          '/rgs': (context) => RegisterPage(),
          '/lgn': (context) => LoginPage(),
        },
      ),
    );
  }
}
