import 'package:aquascaper_app/services/auth_services.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                return emailController.text == value
                    ? null
                    : "Masukkan Email Anda";
              },
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Email',
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 360,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 10,
                  textStyle: TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Send Request',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () async {
                  await AuthServices.resetEmail(emailController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
