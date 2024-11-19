import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/favorite_controller.dart';
import '../model/ModelTeam.dart';
import 'my_images.dart';

class ItemTeamMobile extends StatelessWidget {
  final double containerMargin;
  final Color containerColor;
  final double containerRadius;
  final double padding;
  final double imageWidth;
  final double imageHeight;
  final double imageRadius;
  final String image;
  final BoxFit imageFit;
  final double marginTop;
  final double marginLeft;
  final CrossAxisAlignment crossAxisAlignment;
  final String product;
  final double productFontSize;
  final FontWeight productFontWeight;
  final String font;
  final double marginRating;
  final double ratingFontSize;
  final String rating;
  final double iconSize;
  final Color ratingIconColor;
  final IconData moneyIcon;
  final double spacePrice;
  final void Function() onTap;
  final IconData iconAction;
  final Color iconActionColor;
  final void Function() onPressed;
  final IconData iconRating;

  const ItemTeamMobile(
      {super.key,
      required this.containerMargin,
      required this.containerColor,
      required this.containerRadius,
      required this.padding,
      required this.imageWidth,
      required this.imageHeight,
      required this.imageRadius,
      required this.image,
      required this.imageFit,
      required this.marginTop,
      required this.marginLeft,
      required this.crossAxisAlignment,
      required this.product,
      required this.productFontSize,
      required this.productFontWeight,
      required this.font,
      required this.marginRating,
      required this.ratingFontSize,
      required this.rating,
      required this.iconSize,
      required this.ratingIconColor,
      required this.moneyIcon,
      required this.spacePrice,
      required this.onTap,
      required this.iconAction,
      required this.iconActionColor,
      required this.onPressed,
      required this.iconRating});

  @override
  Widget build(BuildContext context) {

    final FavoriteController favoriteController = Get.find();
    final TeamModel modelTeam;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(containerMargin),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(containerRadius),
              color: containerColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: MyImages(
                      imageWidth: imageWidth,
                      imageHeight: imageHeight,
                      imageRadius: BorderRadius.only(
                        topLeft: Radius.circular(imageRadius),
                        bottomLeft: Radius.circular(imageRadius),
                      ),
                      image: image,
                      imageFit: imageFit,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: marginTop, left: marginLeft, right: marginLeft),
                    child: Column(
                      crossAxisAlignment: crossAxisAlignment,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 240
                          ),
                          child: Text(
                            product,
                            style: TextStyle(
                              fontSize: productFontSize,
                              fontWeight: productFontWeight,
                              fontFamily: font,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: marginRating),
                          child: Row(children: [
                            Icon(
                              iconRating,
                              size: iconSize,
                              color: ratingIconColor,
                            ),
                            Text(
                              rating,
                              style: TextStyle(
                                  fontSize: ratingFontSize,
                                  color: Color(0xff9c9c9c),
                                  fontFamily: font),
                            )
                          ]),
                        ),
                        Row(
                          children: [
                            Icon(Icons.share),
                            IconButton(
                              onPressed: () {
                                onPressed();
                              },
                              icon: Icon(iconAction),
                              color: iconActionColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
