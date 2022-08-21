import 'package:aquascaper_app/models/user_model.dart';
import 'package:aquascaper_app/services/user_services.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel userModel;

  EditProfilePage(this.userModel);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.userModel.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Name',
                ),
              ),
            ),
            SizedBox(
              height: 24,
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
                  UserModel editedUserModel = UserModel(
                    widget.userModel.id,
                    widget.userModel.email,
                    name: _nameController.text,
                  );
                  UserServices.updateUserProfile(editedUserModel);
                  final snackBar = SnackBar(
                    content: Text("Success"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
