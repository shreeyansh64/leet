import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<dynamic> user = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "PROFILE PAGE",
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 5,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 40),
        child: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            final item = user[index];
            final imageSrc = item['avatar'];
            return ListTile(
              leading: ClipRRect(borderRadius: BorderRadiusGeometry.circular(30),child: Image.network(imageSrc),),
              title: Text(item['name']),  
              titleTextStyle: TextStyle(color: Colors.black,fontFamily: 'Poppins',fontWeight: FontWeight.w900,fontSize: 24),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username : ${item['username']}"),
                  Text("Ranking : ${item['ranking']}"),
                  Text("Reputation : ${item['reputation']}"),
                ],
              ),
              
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: fetch,child: Text("Fetch"),),
    );
  }

  void fetch()async{
    print("Button clicked");
    final url = "https://alfa-leetcode-api.onrender.com/cpcs";
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final body = res.body;
    final data = jsonDecode(body);
    setState(() {
      user = [data];
    });
    print("End");
  }


}
