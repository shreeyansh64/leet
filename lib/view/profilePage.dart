// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
  List<dynamic> user = [];
  TextEditingController controller = TextEditingController();
  // Future<void> savedata() async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('user', )
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "PROFILE",
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 5,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) {
                  final item = user[index];
                  final imageSrc = item['avatar'];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  imageSrc,
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text("1. Username: ${item['username']}"),
                          Text("2. Ranking: ${item['ranking']}"),
                          Text("3. Reputation: ${item['reputation']}"),
                          Text("4. Birthday: ${item['birthday']}"),
                          Text("5. Country: ${item['country']}"),
                          Text("6. School: ${item['school']}"),
                          SizedBox(height: 12),
                          Text(
                            "LINKS:",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text("Github : ${item['gitHub']}"),
                          Text("LinkedIn : ${item['linkedIN']}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetch,
        child: Text("Fetch"),
      ),
    );
  }

  void fetch() async {
    // print("Button clicked");
    setState(() {
      isLoading = true;
    });

    final url = "https://alfa-leetcode-api-88t9.onrender.com/cpcs";
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final body = res.body;
    final data = jsonDecode(body);

    setState(() {
      user = [data];
      isLoading = false;
    });

    // print(data);
  }
}
