// api/ProfileService.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/ProfileResponseModel.dart';

class ProfileService {
  Future<ProfileResponseModel> getProfile(String token) async {
    final response = await http.get(
      Uri.parse('https://mediadwi.com/api/latihan/get-profile?token=$token'),

    );

    if (response.statusCode == 200) {
      return ProfileResponseModel.fromJson(json.decode(response.body));
    } else {
      throw "Failed to load profile data";
    }
  }
}
