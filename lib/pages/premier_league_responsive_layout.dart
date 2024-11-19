import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/responsif_controller.dart';
import 'menu/premier_league_menu_mobile.dart';
import 'menu/premier_league_menu_tablet.dart';

class PremierLeagueResponsiveLayout extends StatelessWidget {
  PremierLeagueResponsiveLayout({super.key});

  ResponsifController responsifController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (responsifController.isMobile()) {
        return PremierLeagueMenuMobile();
      } else {
        return PremierLeagueMenuTablet();
      }
    });
  }
}
