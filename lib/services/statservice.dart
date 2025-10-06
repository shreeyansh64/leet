import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leet/models/statsmodel.dart';

class StatsService {
  Future<StatsModel?> fetchStats(String username) async {
    final url = Uri.parse('https://alfa-leetcode-api-88t9.onrender.com/$username/solved');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return StatsModel.fromJson(data);
      } else {
        print('Failed to fetch stats. Status Code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching stats: $e');
      return null;
    }
  }
}
