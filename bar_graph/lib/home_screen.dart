import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'models/chart_model.dart';

class Homepage extends StatelessWidget {


  final List<BarGraph> data = [
    BarGraph(year: "2013",
        financial: 40,
        color:charts.ColorUtil.fromDartColor(Colors.cyanAccent)),

    BarGraph(year: "2014",
        financial: 150,
        color: charts.ColorUtil.fromDartColor(Colors.red)),

    BarGraph(year: "2015",
        financial: 250,
        color: charts.ColorUtil.fromDartColor(Colors.yellowAccent)),

    BarGraph(year: "2016",
        financial: 850,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    BarGraph(year: "2017",
        financial: 150,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    BarGraph(year: "2018",
        financial: 550,
        color: charts.ColorUtil.fromDartColor(Colors.purple)),




  ];



  @override
  Widget build(BuildContext context) {

    List<charts.Series<BarGraph,String>> series = [
     charts.Series(
       id:"financial",
       data: data,
       domainFn: (BarGraph series , _ ) => series.year,
       measureFn: (BarGraph series , _ ) =>series.financial,
       colorFn: (BarGraph series , _ ) => series.color,
     )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Bar Graphs"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Container(
          child: charts.BarChart(
            series,
            animate: true,
          )
        ),
      ),
    );
  }
}
