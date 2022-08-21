import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'CircleProgress.dart';
import 'main.dart';

class AlertPage extends StatefulWidget {
  @override
  _DashboardState.createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  final databaseReference = FirebaseDatabase.instance.ref();

  AnimationController progressController;
  Animation<double> tempAnimation;
  Animation<double> pHAnimation;

  @override
  void initState() {
    super.initState();

    databaseReference
        .child('inputSensor')
        .once()
        .then((DataSnapshot snapshot) {
      double temp = snapshot.value['suhu'];
      double pH = snapshot.value['pH'];

      isLoading = true;
      _DashboardInit(temp, pH);
    });
  }

  _DashboardInit(double temp, double pH) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000)); //5s

    tempAnimation =
    Tween<double>(begin: -50, end: temp).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    pHAnimation =
    Tween<double>(begin: 0, end: pH).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: new IconButton(
            icon: Icon(Icons.reorder), onPressed: handleLoginOutPopup),
      ),
      body: Center(
          child: isLoading
              ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomPaint(
                foregroundPainter:
                CircleProgress(tempAnimation.value, true),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Temperature'),
                        Text(
                          '${tempAnimation.value.toInt()}',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '°C',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomPaint(
                foregroundPainter:
                CircleProgress(pHAnimation.value, false),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Humidity'),
                        Text(
                          '${pHAnimation.value.toInt()}',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
              : Text(
            'Loading...',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
    );
  }
}
