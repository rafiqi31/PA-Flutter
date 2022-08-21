import 'package:aquascaper_app/models/user_model.dart';
import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  final AsyncSnapshot<UserModel> _userModelSnapshot;

  HeaderDrawer(this._userModelSnapshot);

  @override
  _HeaderDrawerState createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: widget._userModelSnapshot.hasError
          ? Container()
          : widget._userModelSnapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget._userModelSnapshot.data.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        widget._userModelSnapshot.data.email,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
    );
  }
}
