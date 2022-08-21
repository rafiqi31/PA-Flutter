import 'package:another_flushbar/flushbar.dart';
import 'package:aquascaper_app/services/auth_services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ListView(
              physics: BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    Text('Register'),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Full Name',
                        hintText: 'Full Name',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
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
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Password',
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      controller: retypePasswordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Confirm Password',
                        hintText: 'Confirm Password',
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                          'Sign Up',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () async {
                          if (!(nameController.text.trim() != '' &&
                              emailController.text.trim() != '' &&
                              passwordController.text.trim() != '' &&
                              retypePasswordController.text.trim() != '')) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: 'Please fill all the fields',
                            )..show(context);
                          } else if (passwordController.text !=
                              retypePasswordController.text) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message:
                                  'Missmatch password and confirmed password',
                            )..show(context);
                          } else if (passwordController.text.length < 6) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Password's and length min 6 characters",
                            )..show(context);
                          } else if (!EmailValidator.validate(
                              emailController.text)) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: 'Wrong formatted email address',
                            )..show(context);
                          } else {
                            SignInSignUpResult result =
                                await AuthServices.signUp(
                              emailController.text,
                              passwordController.text,
                              nameController.text,
                            );

                            if (result.user != null) {
                              Navigator.pop(context);
                            } else {
                              final snackBar = SnackBar(
                                content: Text(result.message),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Already have an account ? Login',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
