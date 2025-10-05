
import 'package:flutter/material.dart';
import 'package:leet/view/badgespage.dart';
import 'package:leet/view/contestpage.dart';
import 'package:leet/view/profilepage.dart';
import 'package:leet/view/solvedpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    ProfilePage(),
    BadgesPage(),
    ContestPage(),
    SolvedPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.white,
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          destinations: [
          NavigationDestination(icon: Icon(Icons.person_2_outlined,color: Colors.black,), label: "Profile",selectedIcon: Icon(Icons.person_2_rounded),),
          NavigationDestination(icon: Icon(Icons.emoji_events_outlined,color: Colors.black,), label: "Badges",selectedIcon: Icon(Icons.emoji_events),),
          NavigationDestination(icon: Icon(Icons.timeline_outlined,color: Colors.black,), label: "Contest",selectedIcon: Icon(Icons.timeline_rounded),),
          NavigationDestination(icon: Icon(Icons.task_outlined,color: Colors.black,), label: "Solved",selectedIcon: Icon(Icons.task),)
        ]),
      ),
    );
  }
}
