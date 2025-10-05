import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List chartData = [
    [40, 'Hard Questions', Color.fromRGBO(82, 98, 266, 1)],
    [20, 'Medium Questions', Color.fromRGBO(252, 91, 57, 1)],
    [10, 'Easy Questions', Color.fromRGBO(123, 201, 82, 1)],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: SfCircularChart(
          series: [
            DoughnutSeries(
              radius: '80%',
              dataSource: chartData,
              yValueMapper: (data, index) => data[0],
              xValueMapper: (data, index) => data[1],
              explode: true,
              dataLabelMapper: (data, index) => data[0].toString(),
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
              ),
            ),
          ],
          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            textStyle: TextStyle(color: Colors.black,fontSize: 20),
            orientation: LegendItemOrientation.vertical,
            iconHeight: 20,iconWidth: 40
          ),
        ),
      ),
    );
  }
}
