import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leet/models/contestmodel.dart';

class ContestService {
  Future<ContestModel?> fetchContest(String username) async {
    try {
      final response = await http.get(
        Uri.parse('https://alfa-leetcode-api-88t9.onrender.com/cpcs/contest/$username'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ContestModel.fromJson(data);
      } else {
        print('Failed to fetch contest data. Status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching contest data: $e');
      return null;
    }
  }
}
