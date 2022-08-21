import 'package:aquascaper_app/chart/day_chart/bar_chart_home_day.dart';
import 'package:aquascaper_app/chart/time_chart/bar_chart_home_time.dart';
import 'package:flutter/material.dart';

class turbidity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turbidity'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              BarChartHomeTime(),
              SizedBox(
                height: 20,
              ),
              BarChartHomeDay(),
            ],
          ),
        ],
      ),
    );
  }
}
