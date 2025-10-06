import 'package:flutter/material.dart';
import 'package:leet/models/statsmodel.dart';
import 'package:leet/services/statservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SolvedPage extends StatefulWidget {
  const SolvedPage({super.key});

  @override
  State<SolvedPage> createState() => _SolvedPageState();
}

class _SolvedPageState extends State<SolvedPage> {
  bool isLoading = false;
  StatsModel? solved;

  @override
  void initState() {
    super.initState();
    loadUserAndFetchsolved();
  }

  Future<void> loadUserAndFetchsolved() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user') ?? 'defaultusername';
    fetchsolved(user);
  }

  Future<void> fetchsolved(String username) async {
    setState(() => isLoading = true);
    final service = StatsService();
    final fetchedsolved = await service.fetchStats(username);
    if(!mounted) return;
    setState(() {
      solved = fetchedsolved;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Badges")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : solved == null
              ? const Center(child: Text("No user found"))
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
    );
  }
}
