import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'bar_chart_graph.dart';
import 'bar_chart_model.dart';

class BarChartHomeTime extends StatefulWidget {
  @override
  _BarChartHomeTimeState createState() => _BarChartHomeTimeState();
}

class _BarChartHomeTimeState extends State<BarChartHomeTime> {
  final List<BarChartModel> data = [
    BarChartModel(
      value: 1,
      time: '1',
      color: charts.ColorUtil.fromDartColor(Color(0xFF47505F)),
    ),
    BarChartModel(
      value: 2,
      time: '2',
      color: charts.ColorUtil.fromDartColor(Color(0xFF47505F)),
    ),
    BarChartModel(
      value: 3,
      time: '3',
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      time: '4',
      value: 4,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      time: '5',
      value: 5,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModel(
      time: '6',
      value: 6,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      time: '7',
      value: 7,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      time: '8',
      value: 8,
      color: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    BarChartModel(
      time: '9',
      value: 9,
      color: charts.ColorUtil.fromDartColor(Colors.lime),
    ),
    BarChartModel(
      time: '10',
      value: 10,
      color: charts.ColorUtil.fromDartColor(Colors.cyan),
    ),
    BarChartModel(
      time: '11',
      value: 11,
      color: charts.ColorUtil.fromDartColor(Colors.lightGreen),
    ),
    BarChartModel(
      time: '12',
      value: 12,
      color: charts.ColorUtil.fromDartColor(Colors.yellowAccent),
    ),
    BarChartModel(
      time: '13',
      value: 13,
      color: charts.ColorUtil.fromDartColor(Colors.redAccent),
    ),
    BarChartModel(
      time: '14',
      value: 14,
      color: charts.ColorUtil.fromDartColor(Colors.deepPurple),
    ),
    BarChartModel(
      time: '15',
      value: 15,
      color: charts.ColorUtil.fromDartColor(Colors.deepOrange),
    ),
    BarChartModel(
      time: '16',
      value: 16,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: BarChartGraph(
          data: data,
        ),
      ),
    );
  }
}
