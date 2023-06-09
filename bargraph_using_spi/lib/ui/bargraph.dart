import 'dart:math';

import 'package:bargraph_using_spi/network/NetworkHelper.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart' ;

import '../model/GenderModel.dart';

class BarGraph extends StatefulWidget {
  const BarGraph({Key? key}) : super(key: key);

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  List<GenderModel> gendersData = [];
  List<GenderModel> pieChart = [];
  bool isLoading = true;

  final NetworkHelper _networkHelper = NetworkHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    User();
  }

  // Pipe Chart Data
  Future <void> getDataPie()
  async {
    var response = await _networkHelper.get(APIConstants.Base_url);
    List<GenderModel> result = genderModelFromJson(response.body);
    setState(() {
      pieChart = result;
    });
  }

// Bar Graph Data
  Future<void> getData() async {
    var response = await _networkHelper.get(APIConstants.Base_url);
    List<GenderModel> tempData = genderModelFromJson(response.body);
    setState(() {
      gendersData = tempData;
      isLoading = false;
    });
  }

  List<charts.Series<GenderModel, String>> createSampleData() {
    return [
      charts.Series<GenderModel, String>(
        data: gendersData,
        id: "gender",
        colorFn: (genderModel, _) => charts.MaterialPalette.pink.shadeDefault,
        domainFn: (GenderModel genderModel, _) => genderModel.name.toString(),
        measureFn: (GenderModel genderModel, _) => genderModel.count,
      )
    ];
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          // body: SfCircularChart(
          //   series: <CircularSeries>[
          //     PieSeries<GenderModel,String >(
          //         dataSource: pieChart ,
          //         xValueMapper: (GenderModel  data,_)=> data.gender,
          //         yValueMapper: (GenderModel data,_) => data.count,
          //         dataLabelSettings: const DataLabelSettings(isVisible: true)
          //     )
          //   ],


          body: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: 300,
                    child: charts.BarChart(
                      createSampleData(),
                      animate: true,
                    ),
                  ),
          ),
      ),
    );
  }

   User()
  {

    SfCircularChart(
      series: <CircularSeries>[
        PieSeries<GenderModel,String >(
            dataSource: pieChart ,
            xValueMapper: (GenderModel  data,_)=> data.gender,
            yValueMapper: (GenderModel data,_) => data.count,
            dataLabelSettings: const DataLabelSettings(isVisible: true)
        )
      ],
    );

  }

}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C','A', 'B', 'C','A', 'B', 'C',];
    final List<int> colorCodes = <int>[600, 500, 100,600, 500, 100,600, 500, 100];
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("12121"),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("545"),
                  Text("12121"),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.amber[colorCodes[index]],
                      child: Center(child: Text('Entry ${entries[index]}')),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
