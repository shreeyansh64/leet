import 'package:flutter/material.dart';

class BadgesPage extends StatefulWidget {
  const BadgesPage({super.key});

  @override
  State<BadgesPage> createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "BADGES",
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
