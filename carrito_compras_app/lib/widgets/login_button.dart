import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color? textColor;
  final double fontSize;


  const LoginButton({Key? key, required this.text, required this.backgroundColor, this.onPressed, this.textColor, required this.fontSize, required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side:  BorderSide(
            color: borderColor,
            width: 2),
      ),
      onPressed: onPressed,
      height: Get.height * 0.08,
      minWidth: Get.width,
      child: Text(
        text,
        style:  TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}