
import 'package:flutter/material.dart';
import 'package:leet/view/chart.dart';

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
      body: Chart(), 
    );
  }
}
