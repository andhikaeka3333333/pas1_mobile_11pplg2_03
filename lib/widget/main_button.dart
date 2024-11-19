import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String textButton;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String font;
  final Color buttonBackgroundColor;
  final double buttonWidth;
  final double buttonHeight;
  final double buttonHorizontalPadding;
  final double buttonVerticalPadding;
  final double buttonRadius;
  final void Function() onPresssed;

  const MainButton(
      {super.key,
      required this.textButton,
      required this.textColor,
      required this.fontSize,
      required this.fontWeight,
      required this.font,
      required this.buttonBackgroundColor,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.buttonHorizontalPadding,
      required this.buttonVerticalPadding,
      required this.buttonRadius,
      required this.onPresssed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPresssed();
      },
      child: Text(
        textButton,
        style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: font),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackgroundColor,
        minimumSize: Size(buttonWidth, buttonHeight),
        padding: EdgeInsets.symmetric(
            horizontal: buttonHorizontalPadding,
            vertical: buttonVerticalPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
      ),
    );
  }
}
