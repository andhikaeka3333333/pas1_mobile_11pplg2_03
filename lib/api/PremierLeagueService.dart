
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/ModelTeam.dart';

class PremierLeagueService {
  final String baseUrl = 'https://thesportsdb.com';

  Future<List<TeamModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List data = jsonResponse['teams'];

      return data.map((json) => TeamModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}