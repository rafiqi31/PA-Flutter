import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  final int value;
  final String time;
  final charts.Color color;

  BarChartModel({
    this.value,
    this.time,
    this.color,
  });
}
