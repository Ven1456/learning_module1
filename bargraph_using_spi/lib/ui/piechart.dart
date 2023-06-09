import 'package:bargraph_using_spi/model/GenderModel.dart';
import 'package:bargraph_using_spi/ui/indiacator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'Section.dart';

class PieChartClass extends StatefulWidget {
  PieChartClass({Key? key}) : super(key: key);

  @override
  State<PieChartClass> createState() => _PieChartClassState();
}

class _PieChartClassState extends State<PieChartClass> {
     int touchedIndex =  0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          const SizedBox(height: 150,),


          Center(
            child: SizedBox(
              height: 350,
              child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse)
                          {
                            setState(() {
                          if(pieTouchResponse?.touchedSection is FlLongPressEnd || pieTouchResponse?.touchedSection is FlPanEndEvent )
                          {
                          touchedIndex = -1;

                          }
                          else
                          {
                            touchedIndex = pieTouchResponse!.touchedSection!.touchedSectionIndex;
                          }
                            });
                          }

                    ),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 4,
                      centerSpaceRadius: 80,
                      sections: GetSection(touchedIndex))),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Indicator()

            ],
          ),
        ],
      ),
    );
  }

 // List<PieChartSectionData> GetSection() {
 //    PieData.data
 //        .asMap()
 //        .map<int, PieChartSectionData>((index, data) {
 //          final value = PieChartSectionData(
 //              color: data.color,
 //              value: data.percentage,
 //              title: "${data.percentage}%");
 //          return MapEntry(index, value);
 //
 //        })
 //        .values
 //        .toList();
 //  }
}

class PieData {

  static List<GenderModel> data = [
GenderModel(name: "Venkat ",probability: 11,color: Colors.green),
    GenderModel(name: "gopi",probability: 15,color: Colors.yellow),
    GenderModel(name: "pavan ",probability: 25,color: Colors.pink),




    // Data("help", 18, Colors.black),
    // Data("bnv", 3, Colors.cyan),
    // Data("po", 5, Colors.pink),
    // Data("op", 18, Colors.red),
    // Data("ghg", 2, Colors.green),
    // Data("rte", 7, Colors.yellow),
  ];
  static List<Colorstest> test = [
    Colorstest(color: Colors.green),
    Colorstest(color: Colors.yellow),
    Colorstest(color: Colors.pink)



    // Data("help", 18, Colors.black),
    // Data("bnv", 3, Colors.cyan),
    // Data("po", 5, Colors.pink),
    // Data("op", 18, Colors.red),
    // Data("ghg", 2, Colors.green),
    // Data("rte", 7, Colors.yellow),
  ];
// static List<Color> color = [
//  Color(color: Colors.black)
//
// ];
}

class Data {
  final String title;
  final double percentage;
  final Color color;

  Data(this.title, this.percentage, this.color);
}

class Colorstest{
  final Color color;
  final String? title;
  Colorstest( {required this.color,this.title});
}
