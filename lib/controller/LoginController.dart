import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/LoginService.dart';
import '../model/LoginResponseModel.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginStatus = "".obs;
  var token = "".obs;

  final ApiService _apiService = ApiService();

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('token');
    if (savedToken != null && savedToken.isNotEmpty) {
      token.value = savedToken;
      Get.offNamed('/dashboard');
    }
  }

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final LoginResponseModel response =
          await _apiService.login(username, password);
      loginStatus.value = response.message;
      if (response.status) {
        token.value = response.token ?? '';

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token.value);

        Get.offNamed('/dashboard');
      } else {
        throw response.message;
      }
    } catch (e) {
      loginStatus.value = "Error: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    token.value = '';
    Get.offAllNamed('/');
  }
}
