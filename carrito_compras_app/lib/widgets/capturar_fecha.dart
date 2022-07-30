import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CapturarFecha extends StatelessWidget {
  const CapturarFecha({
    Key? key,
    required this.selectedOption,
    required this.onTap,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
  }) : super(key: key);
  final void Function()? onTap;
  final String selectedOption;
  final IconData icon;
  final double iconSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // margin: EdgeInsets.all(Get.height*0.01),
        height: Get.height * 0.065,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: Get.height * 0.018),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          border: Border.all(
            color: const Color.fromARGB(255, 201, 201, 201),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedOption,
                style: TextStyle(
                    color: const Color.fromARGB(255, 100, 100, 100),
                    // fontWeight: FontWeight.bold,
                    fontSize: Get.height * 0.020),
              ),
            ),
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
