import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ButtonText extends StatelessWidget {
  
  final String title;
  final double height;
  final double width;

  const ButtonText({
    Key? key, required this.title, required this.height, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30, bottom: 15, left: 25),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: AppTheme.primaryAzul, borderRadius: BorderRadius.circular(25)),
      child:  Text(
        title,
        style: const TextStyle(
            color: AppTheme.primaryYellow, fontWeight: FontWeight.bold),
      ),
    );
  }
}