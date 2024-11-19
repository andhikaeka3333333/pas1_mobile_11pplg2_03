import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component_pages/adapter_favorite_team.dart';
import '../../controller/favorite_controller.dart';
import '../../widget/colors.dart';

class FavoriteMenuMobile extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    favoriteController.loadFavorites();

    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (favoriteController.favorites.isEmpty) {
                return Center(
                  child: Text(
                    'Belum ada team yang anda sukai 🤷‍♂️',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Mulish'),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: favoriteController.favorites.length,
                  itemBuilder: (context, index) {
                    final movie = favoriteController.favorites[index];
                    return AdapterFavoriteTeam(
                      modelTeam: movie,
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
