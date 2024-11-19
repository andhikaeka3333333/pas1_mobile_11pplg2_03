import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dashboard_controller.dart';
import 'menu/favorite_menu.dart';
import 'menu/premier_league_menu.dart';
import 'menu/profile_menu.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());


    final List<Widget> menus = [
      PremierLeagueMenu(),
      FavoriteMenu(),
      ProfileMenu()
    ];

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text("Navigation Bar Example"),
        ),
        body: menus[dashboardController.selectedIndex.value],
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 100,
                      ),
                      Text("admin12345")
                    ],
                  )),
              ListTile(
                leading: Icon(Icons.sports_soccer),
                title: Text("Premier League"),
                onTap: () {
                  dashboardController.changeMenu(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favorite"),
                onTap: () {
                  dashboardController.changeMenu(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Profile"),
                onTap: () {
                  dashboardController.changeMenu(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
