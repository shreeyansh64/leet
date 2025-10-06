import 'package:flutter/material.dart';
import 'package:leet/models/badgesmodel.dart';
import 'package:leet/services/badgeservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BadgesPage extends StatefulWidget {
  const BadgesPage({super.key});

  @override
  State<BadgesPage> createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage> {
  bool isLoading = false;
  BadgeModel? badges;

  @override
  void initState() {
    super.initState();
    loadUserAndFetchBadges();
  }

  Future<void> loadUserAndFetchBadges() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user') ?? 'defaultusername';
    fetchBadges(user);
  }

  Future<void> fetchBadges(String username) async {
    setState(() => isLoading = true);
    final service = BadgeService();
    final fetchedBadges = await service.fetchBadges(username);
    // if(!mounted) return;
    setState(() {
      badges = fetchedBadges;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Badges")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : badges == null
              ? const Center(child: Text("No user found"))
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Badges: ${badges?.badgesCount ?? 0}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: badges?.badges.length ?? 0,
                          itemBuilder: (context, index) {
                            final badge = badges?.badges[index];
                            return ListTile(
                              leading: Image.network(
                                badge?.icon ?? '',
                                width: 40,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              ),
                              title: Text(badge?.displayName ?? 'N/A'),
                              subtitle: Text(
                                  "Earned on: ${badge?.creationDate ?? 'Unknown'}"),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
