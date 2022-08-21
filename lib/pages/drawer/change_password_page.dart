import 'package:aquascaper_app/services/auth_services.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  bool checkCurrentPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  TextFormField(
                    obscureText: true,
                    controller: currentPassController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Current password',
                    ),
                    validator: (value) {
                      return value.isEmpty
                          ? "This field cannot be empty"
                          : null;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: newPassController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'New password',
                    ),
                    validator: (value) {
                      return value.isEmpty
                          ? "This field cannot be empty"
                          : null;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: confirmPassController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Confirm new password',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field cannot be empty";
                      }

                      if (newPassController.text != value) {
                        return "Please validate your password";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
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
                        'Submit',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          Result result = await AuthServices.changePassword(
                            currentPassword: currentPassController.text,
                            newPassword: newPassController.text,
                          );

                          switch (result.state) {
                            case ResultState.success:
                              Navigator.pop(context);
                              break;
                            case ResultState.failed:
                              final snackBar = SnackBar(
                                content: Text(result.message),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              break;
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
