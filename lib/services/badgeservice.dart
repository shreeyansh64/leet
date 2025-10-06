import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leet/models/badgesmodel.dart';
import 'dart:developer' as dev;

class BadgeService {
  Future<BadgeModel?> fetchBadges(String username) async {
    final url = Uri.parse('https://alfa-leetcode-api-88t9.onrender.com/$username/badges');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        dev.log(data);
        return BadgeModel.fromJson(data);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exception while fetching badges: $e');
      return null;
    }
  }
}
