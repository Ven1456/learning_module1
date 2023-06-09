import 'package:bargraph_using_spi/ui/piechart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

List<PieChartSectionData> GetSection(int touchedIndex) => PieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {

      final isTouched =  index == touchedIndex;
      final double radius = isTouched ? 70 : 50;
      final double fontSize =  isTouched ? 28 : 15;

      final value = PieChartSectionData(
          color: data.color,
          value: data.probability,
          radius: radius,
          titleStyle: TextStyle(fontSize: fontSize),
          title: "${data.name}");
      return MapEntry(index, value);
    })
    .values
    .toList();
