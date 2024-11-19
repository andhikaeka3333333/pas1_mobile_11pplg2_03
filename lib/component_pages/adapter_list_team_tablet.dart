import 'package:flutter/material.dart';
import '../controller/favorite_controller.dart';
import '../model/ModelTeam.dart';
import '../widget/colors.dart';
import '../widget/item_team_tablet.dart';
import 'package:get/get.dart';

class AdapterListTablet extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();
  final TeamModel modelTeam;

  AdapterListTablet({super.key, required this.modelTeam});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isLiked = favoriteController.isFavorite(modelTeam);  // Memastikan status favorit selalu up-to-date

      return ItemTeamTablet(
        containerMargin: 15.0,
        containerColor: containerColor,
        containerRadius: 15.0,
        padding: 0.0,
        imageWidth: 100.0,
        imageHeight: 100.0,
        imageRadius: 8.0,
        image: modelTeam.strBadge,
        imageFit: BoxFit.cover,
        marginTop: 10.0,
        marginLeft: 12.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        product: modelTeam.strTeam,
        productFontSize: 15.0,
        productFontWeight: FontWeight.bold,
        font: 'Mulish',
        marginRating: 2,
        ratingFontSize: 14.0,
        rating: modelTeam.strStadium.toString(),
        iconSize: 15.0,
        ratingIconColor: primaryColor,
        moneyIcon: Icons.monetization_on,
        spacePrice: 5.0,
        iconRating: Icons.stadium,
        iconAction: isLiked ? Icons.favorite : Icons.favorite_border,
        onTap: () {
          Get.toNamed('/team-detail', arguments: modelTeam);
        },
        onPressed: () {
          if (isLiked) {
            favoriteController.removeFavorite(modelTeam.strTeam);
          } else {
            favoriteController.addFavorite(modelTeam);
          }
        },
        iconActionColor: isLiked ? Colors.red : Colors.grey,
      );
    });
  }
}
