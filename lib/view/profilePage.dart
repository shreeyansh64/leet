import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:leet/models/profilemodel.dart';
import 'package:leet/services/profileservice.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile? profile;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadUsernameAndFetchProfile();
  }

  Future<void> loadUsernameAndFetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('user') ?? 'defaultUsername';
    fetchUserData(savedUsername);
  }

  Future<void> fetchUserData(String username) async {
    setState(() => isLoading = true);
    ProfileService profileservice = ProfileService();
    Profile? fetchedUser = await profileservice.fetchProfile(username);
    setState(() {
      profile = fetchedUser;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : profile == null
              ? const Center(child: Text("No user found"))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    children: [
                      Text("Username: ${profile?.username ?? 'N/A'}"),
                      Text("Name: ${profile?.name ?? 'N/A'}"),
                      Text("Birthday: ${profile?.birthday ?? 'N/A'}"),
                      Text("Avatar URL: ${profile?.avatar ?? 'N/A'}"),
                      Text("Ranking: ${profile?.ranking ?? 'N/A'}"),
                      Text("Reputation: ${profile?.reputation ?? 'N/A'}"),
                      Text("GitHub: ${profile?.gitHub ?? 'N/A'}"),
                      Text("Twitter: ${profile?.twitter ?? 'N/A'}"),
                      Text("LinkedIn: ${profile?.linkedIN ?? 'N/A'}"),
                      Text("Website: ${profile?.website?.join(', ') ?? 'N/A'}"),
                      Text("Country: ${profile?.country ?? 'N/A'}"),
                      Text("Company: ${profile?.company ?? 'N/A'}"),
                      Text("School: ${profile?.school ?? 'N/A'}"),
                      Text("Skills: ${profile?.skillTags?.join(', ') ?? 'N/A'}"),
                      Text("About: ${profile?.about ?? 'N/A'}"),
                    ],
                  ),
                ),
    );
  }
}
