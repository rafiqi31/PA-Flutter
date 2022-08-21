import 'package:aquascaper_app/models/user_model.dart';
import 'package:aquascaper_app/widgets/card_one.dart';
import 'package:aquascaper_app/widgets/card_two.dart';
import 'package:flutter/material.dart';

class DevicesPage extends StatelessWidget {
  final AsyncSnapshot<UserModel> _userModelSnapshot;

  DevicesPage(this._userModelSnapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            clipBehavior: Clip.none,
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CardOne(
                          bgColor: Colors.red,
                          txtTitle: 'Temperature',
                          txtDesc: _userModelSnapshot.hasData
                              ? '${_userModelSnapshot.data.temperature}°C'
                              : '-',
                          page: '/tmp',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CardOne(
                          bgColor: Colors.orange,
                          txtTitle: 'pH Meter',
                          txtDesc: _userModelSnapshot.hasData
                              ? _userModelSnapshot.data.ph.toString()
                              : '-',
                          page: '/phm',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CardOne(
                          bgColor: Colors.greenAccent[700],
                          txtTitle: 'Turbidity',
                          txtDesc: _userModelSnapshot.hasData
                              ? '${_userModelSnapshot.data.turbidity}NTU'
                              : '-',
                          page: '/tur',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CardOne(
                          bgColor: Colors.blue,
                          txtTitle: 'PPM',
                          txtDesc: _userModelSnapshot.hasData
                              ? _userModelSnapshot.data.ppm.toString()
                              : '-',
                          page: '/ppm',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CardTwo(
                          sideColor: Colors.blueGrey,
                          txtTitle: 'LED Lamp',
                          roundColor: Colors.yellow,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CardTwo(
                          txtTitle: 'Fan',
                          sideColor: Colors.teal,
                          roundColor: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CardTwo(
                    txtTitle: 'Selenoid',
                    sideColor: Colors.lightBlue,
                    roundColor: Colors.yellow,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Water Condition',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Good',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
