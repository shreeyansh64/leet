import 'package:flutter/material.dart';

class ContestPage extends StatefulWidget {
  const ContestPage({super.key});

  @override
  State<ContestPage> createState() => _ContestPageState();
}

class _ContestPageState extends State<ContestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "CONTEST HISTORY",
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 5,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}