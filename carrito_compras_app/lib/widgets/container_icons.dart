import 'package:flutter/material.dart';

class ContainerIcons extends StatelessWidget {
  final double height;
  final double width;
  final AssetImage icon;
  final Color backgrounColor;

  // ignore: use_key_in_widget_constructors
  const ContainerIcons(
      {required this.height,
      required this.width,
      required this.icon,
      this.backgrounColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: backgrounColor,
      child: Image(
        image: icon,
      ),
    );
  }
}
