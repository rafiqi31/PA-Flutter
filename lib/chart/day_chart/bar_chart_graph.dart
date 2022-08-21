import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'bar_chart_model.dart';

class BarChartGraph extends StatefulWidget {
  final List<BarChartModel> data;

  BarChartGraph({this.data});

  @override
  _BarChartGraphState createState() => _BarChartGraphState();
}

class _BarChartGraphState extends State<BarChartGraph> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "Day",
        data: widget.data,
        domainFn: (BarChartModel series, _) => series.day,
        measureFn: (BarChartModel series, _) => series.value,
        colorFn: (BarChartModel series, _) => series.color,
        labelAccessorFn: (BarChartModel series, _) =>
            '${series.value.toString()}',
      ),
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Time'),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
