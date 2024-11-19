import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_03/pages/DetailPage.dart';
import 'package:pas1_mobile_11pplg2_03/pages/LoginPage.dart';
import 'package:pas1_mobile_11pplg2_03/pages/dashboard_page.dart';

import 'bindings/bindings.dart';
import 'controller/LoginController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final loginController = Get.put(LoginController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => FutureBuilder(
                  future: loginController.checkToken(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return LoginPage();
                  },
                )),
        GetPage(name: '/login', page: () => LoginPage(), binding: MyBindings()),
        GetPage(
            name: '/dashboard',
            page: () => DashboardPage(),
            binding: MyBindings()),
        GetPage(
            name: '/team-detail',
            page: () => Detailpage(),
            binding: MyBindings()),
      ],
    );
  }
}
