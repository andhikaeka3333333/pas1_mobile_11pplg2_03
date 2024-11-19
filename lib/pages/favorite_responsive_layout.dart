import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/responsif_controller.dart';
import 'menu/favorite_menu_mobile.dart';
import 'menu/favorite_menu_tablet.dart';


class FavoriteResponsiveLayout extends StatelessWidget {
  FavoriteResponsiveLayout({super.key});
  ResponsifController responsifController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (responsifController.isMobile()) {
        return FavoriteMenuMobile();
      } else {
        return FavoriteMenuTablet();
      }
    });
  }
}

