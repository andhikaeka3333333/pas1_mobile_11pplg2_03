import 'package:flutter/material.dart';
import '../controller/favorite_controller.dart';
import '../model/ModelTeam.dart';
import '../widget/colors.dart';
import '../widget/favorite_item_team_mobile.dart';
import '../widget/favorite_item_team_tablet.dart';
import '../widget/item_team_mobile.dart';
import 'package:get/get.dart';

class AdapterFavoriteTeamTablet extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();
  final TeamModel modelTeam;

  AdapterFavoriteTeamTablet({super.key, required this.modelTeam});

  @override
  Widget build(BuildContext context) {
    return FavoriteItemTeamTablet(
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
        spacePrice: 5.0,
        iconRating: Icons.stadium,
        iconAction: Icons.delete,
        onTap: () {
          Get.toNamed('/team-detail', arguments: modelTeam);
        },
        onPressed: () {
          Get.defaultDialog(
            backgroundColor: whiteColor,
            title: 'Konfirmasi',
            middleText:
            'Apakah kamu yakin untuk menghapus team ini dari daftar favorite?',
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              favoriteController.removeFavorite(modelTeam.strTeam);
              Get.back();
            },
            confirmTextColor: Colors.white,
            textCancel: 'Batal',
            textConfirm: 'Hapus',
            buttonColor: primaryColor,
          );
        },
        iconActionColor: secondaryColor);
  }
}
