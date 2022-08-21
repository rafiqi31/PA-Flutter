import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'bar_chart_graph.dart';
import 'bar_chart_model.dart';

class BarChartHomeDay extends StatefulWidget {
  @override
  _BarChartHomeDayState createState() => _BarChartHomeDayState();
}

class _BarChartHomeDayState extends State<BarChartHomeDay> {
  final List<BarChartModel> data = [
    BarChartModel(
      value: 1,
      day: 'Sun',
      color: charts.ColorUtil.fromDartColor(Color(0xFF47505F)),
    ),
    BarChartModel(
      value: 2,
      day: 'Mon',
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      day: 'Tue',
      value: 3,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      day: 'Wed',
      value: 4,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModel(
      day: 'Thu',
      value: 5,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      day: 'Fri',
      value: 6,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      day: 'Sat',
      value: 7,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
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
