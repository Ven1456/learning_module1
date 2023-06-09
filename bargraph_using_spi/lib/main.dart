import 'package:bargraph_using_spi/ui/bargraph.dart';
import 'package:bargraph_using_spi/ui/piechart.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:Home(),
    );
  }
}
class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  {
final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: scrollController,

                shrinkWrap: false,
                children: [
                   BarGraph(),
                  PieChartClass()
                ],
              ),
            ),
          ),
        ],
      ),
      // body: Row(
      //   children: [
      //     Expanded(child: BarGraph()),
      //     Expanded(child: PieChartClass())
      //   ],


 

    );
  }
}
