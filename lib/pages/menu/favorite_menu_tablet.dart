import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component_pages/adapter_favorite_team.dart';
import '../../component_pages/adapter_favorite_team_tablet.dart';
import '../../controller/favorite_controller.dart';
import '../../widget/colors.dart';

class FavoriteMenuTablet extends StatelessWidget {
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
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // childAspectRatio: (Get.width / 1200),
                    childAspectRatio: context.isLandscape ? 4 / 3 : 4 / 4,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: favoriteController.favorites.length,
                  itemBuilder: (context, index) {
                    final movie = favoriteController.favorites[index];
                    return AdapterFavoriteTeamTablet(
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
