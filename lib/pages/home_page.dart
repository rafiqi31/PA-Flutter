import 'package:aquascaper_app/models/user_model.dart';
import 'package:aquascaper_app/alert_page.dart';
import 'package:aquascaper_app/pages/devices_page.dart';
import 'package:aquascaper_app/services/user_services.dart';
import 'package:aquascaper_app/widgets/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _getNavigationPage(int index, AsyncSnapshot<UserModel> userSnapshot) {
    List<Widget> pages = <Widget>[
      DevicesPage(userSnapshot),
      AlertPage(),
    ];

    return pages[index];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context, listen: false);

    return StreamBuilder<UserModel>(
      stream: UserServices.getUserStream(firebaseUser.uid),
      builder: (context, AsyncSnapshot<UserModel> snapshot) {
        if (snapshot.hasError) {
          final snackBar = SnackBar(
            content: Text("Something went wrong"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(_selectedIndex == 0 ? 'Devices' : 'Alert'),
          ),
          drawer: MainDrawer(snapshot),
          body: _getNavigationPage(_selectedIndex, snapshot),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.blue,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.phone_iphone,
                      size: 35,
                    ),
                    label: 'Devices',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notification_important,
                      size: 35,
                    ),
                    label: 'Alert',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.white,
                iconSize: 40,
                onTap: _onItemTapped,
                elevation: 5,
              ),
            ),
          ),
        );
      },
    );
  }
}
