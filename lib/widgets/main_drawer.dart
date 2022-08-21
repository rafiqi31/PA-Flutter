import 'package:aquascaper_app/models/user_model.dart';
import 'package:aquascaper_app/services/auth_services.dart';
import 'package:aquascaper_app/widgets/drawer_item.dart';
import 'package:aquascaper_app/widgets/header_drawer.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final AsyncSnapshot<UserModel> _userModelSnapshot;

  MainDrawer(this._userModelSnapshot);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HeaderDrawer(_userModelSnapshot),
              DrawerItem(
                icon: Icons.edit,
                text: 'Edit Profile',
                onTap: () => _userModelSnapshot.hasData
                    ? Navigator.pushNamed(
                        context,
                        '/edit',
                        arguments: _userModelSnapshot.data,
                      )
                    : {},
              ),
              DrawerItem(
                icon: Icons.lock,
                text: 'Change Password',
                onTap: () => Navigator.pushNamed(context, '/change'),
              ),
              DrawerItem(
                icon: Icons.person,
                text: 'About',
                onTap: () => Navigator.pushNamed(context, '/about'),
              ),
              Divider(),
              DrawerItem(
                icon: Icons.help,
                text: 'Help',
                onTap: () => Navigator.pushNamed(context, '/help'),
              ),
              DrawerItem(
                icon: Icons.settings,
                text: 'Settings',
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
              DrawerItem(
                icon: Icons.exit_to_app,
                text: 'Logout',
                onTap: () {
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: Text('Are you sure want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                AuthServices.signOut();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
