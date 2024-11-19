import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/LoginController.dart';
import '../../widget/colors.dart';
import '../../widget/main_button.dart';

class ProfileMenu extends StatelessWidget {
  final loginController = Get.put(LoginController());
  ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Top container with rounded corners
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffe7a4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 150),
                  Center(
                    child: Image.asset(
                      "images/profilemale.png",
                      width: 150,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Name
                  Text(
                    'admin12345',
                    style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffbc00),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Email
                  Text(
                    'admin@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Logout Button
                  MainButton(
                    textButton: "LOGOUT",
                    textColor: buttonTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    font: 'Mulish',
                    buttonBackgroundColor: buttonBackgroundColor,
                    buttonWidth: 75.0,
                    buttonHeight: 24.0,
                    buttonHorizontalPadding: 50,
                    buttonVerticalPadding: 20,
                    buttonRadius: 50.0,
                    onPresssed: () {
                      loginController.logout();
                    },
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
