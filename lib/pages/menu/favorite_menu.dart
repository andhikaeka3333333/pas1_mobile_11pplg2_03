import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/responsif_controller.dart';
import '../favorite_responsive_layout.dart';


class FavoriteMenu extends StatelessWidget {
  final ResponsifController responsifController =
  Get.put(ResponsifController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          //update screen here
          responsifController.updateScreenWidth(constraints.maxWidth);
          return FavoriteResponsiveLayout();
        },
      ),
    );
  }
}
