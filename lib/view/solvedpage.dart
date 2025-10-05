import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SolvedPage extends StatefulWidget {
  const SolvedPage({super.key});

  @override
  State<SolvedPage> createState() => _SolvedPageState();
}

class _SolvedPageState extends State<SolvedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "SOLVED PROBLEMS",
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 5,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Text("Questions Solved",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 30),),
          PieChart(
            swapAnimationDuration: Duration(milliseconds: 1000),
            swapAnimationCurve: Curves.easeInOut,
            
            PieChartData(
              sections: [
                PieChartSectionData(value: 20, color: Colors.red[300]),
                PieChartSectionData(value: 10, color: Colors.blueGrey[400]),
                PieChartSectionData(value: 40, color: Colors.blue[400]),
                PieChartSectionData(value: 30, color: Colors.greenAccent[400]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
