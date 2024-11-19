import 'package:flutter/material.dart';

class MyImages extends StatelessWidget {
  final double? imageWidth;
  final double? imageHeight;
  final BorderRadius imageRadius;
  final String image;
  final BoxFit imageFit;

  const MyImages(
      {super.key,
        this.imageWidth,
        this.imageHeight,
        required this.imageRadius,
        required this.image,
        required this.imageFit});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: imageHeight,
        width: imageWidth,
        decoration: BoxDecoration(
          borderRadius: imageRadius,
          image: DecorationImage(
            image: NetworkImage(image,),
            fit: imageFit,
          ),
        ),
    );
  }
}
