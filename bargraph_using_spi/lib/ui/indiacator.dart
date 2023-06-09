import 'package:bargraph_using_spi/ui/piechart.dart';
import 'package:flutter/cupertino.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PieData.data.map((data) => Container(

        child:  buildIndicator(  color: data.color, text: data.name.toString(),),
      )).toList()

    );
  }
  Widget  buildIndicator({
    required Color? color,
    required String text,
    bool isSquare =  false,
    double size=16,
}) => Row(

    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color
          ),
        ),
      ),
      SizedBox(width: 20),
      Text(text)
    ],
  );
}
