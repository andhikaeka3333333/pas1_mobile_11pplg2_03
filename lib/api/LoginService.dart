// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/LoginResponseModel.dart';

class ApiService {
  final String _baseUrl = "https://mediadwi.com/api/latihan/login";

  Future<LoginResponseModel> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "username": username,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return LoginResponseModel.fromJson(responseData);
    } else {
      throw Exception("Failed to login");
    }
  }
}
