import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/LoginController.dart';
import '../widget/my_text.dart';
import '../widget/my_text_field.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Mengganti Column dengan SingleChildScrollView
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Image.asset(
              "images/soccer.png",
              width: 200,
              height: 200,
            ),
            Center(
                child: MyText(
                  hintText: 'Jadikan Sepak Bola Bagian dari Hidup Anda.',
                  fontSize: 18,
                  colors: Colors.grey[700]!,
                  fontFamily: 'NunitoSans',
                  textAlign: TextAlign.center,
                )),
            SizedBox(height: 20),
            MyTextField(
              hintText: 'Username',
              controller: usernameController,
              icon: Icons.person_outline,
            ),

            MyTextField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: Icons.lock_outline,
            ),
            SizedBox(height: 16),
            // Login Button
            Obx(() => ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                WidgetStateProperty.all<Color>(Colors.blueAccent),
                padding: WidgetStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              onPressed: controller.isLoading.value
                  ? null
                  : () async {
                if (usernameController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: MyText(
                        hintText: "Nama dan password harus diisi!",
                        fontSize: 16,
                        colors: Colors.white,
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                } else {await controller.login(usernameController.text,
                    passwordController.text);
                if (controller.loginStatus.value ==
                    "Login success") {
                  Get.offNamed('/dashboard');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: MyText(
                        hintText: controller.loginStatus.value,
                        fontSize: 16,
                        colors: Colors.white,
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
                }
              },
              child: controller.isLoading.value
                  ? CircularProgressIndicator(
                color: Colors.white,
              )
                  : MyText(
                hintText: "Login",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                colors: Colors.white,
              ),
            )),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 270),
              child: MyText(
                hintText: "Forgot Password?",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                colors: Colors.black,
              ),
            ),
            SizedBox(height: 100),
            // Sign Up Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  hintText: "Don't have an account? ",
                  fontSize: 16,
                  colors: Colors.black,
                ),
                MyText(
                  hintText: 'Sign Up',
                  fontSize: 16,
                  colors: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(height: 10),
            // Social Media Login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Aksi login dengan Google
                  },
                  icon: Icon(Icons.tiktok, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    // Aksi login dengan Apple
                  },
                  icon: Icon(Icons.facebook, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}