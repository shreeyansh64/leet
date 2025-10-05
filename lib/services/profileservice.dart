import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leet/models/profilemodel.dart';
import 'dart:developer' as dev;

class ProfileService {
  final String baseUrl = 'https://alfa-leetcode-api-88t9.onrender.com';

  Future<Profile?> fetchProfile(String username) async {
    final url = Uri.parse('$baseUrl/$username');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        dev.log(data.toString());
        return Profile.fromJson(data);
      } else {
        print('Failed to load profile. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching profile: $e');
      return null;
    }
  }
}
