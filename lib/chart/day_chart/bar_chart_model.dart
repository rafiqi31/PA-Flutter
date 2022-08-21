import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  final int value;
  final String day;
  final charts.Color color;

  BarChartModel({
    this.day,
    this.value,
    this.color,
  });
}
