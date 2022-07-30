import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/login_controller.dart';

class LoginInput extends StatefulWidget {
  const LoginInput(
      {Key? key,
      required this.image,
      required this.hintText,
      required this.onChanged,
      required this.isASensitiveField})
      : super(key: key);
  final String image;
  final String hintText;

  final bool isASensitiveField;
  final void Function(String)? onChanged;

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  LoginController loginController = Get.find();

  IconButton verifyIcon() {
    IconButton output = IconButton(
        icon: const Icon(Icons.delete),
        color: Colors.transparent,
        onPressed: () {});

    if (widget.isASensitiveField && loginController.obscurePassword.value) {
      output = IconButton(
        icon: const Icon(
          Icons.visibility_off,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            loginController.obscurePassword.value =
                !loginController.obscurePassword.value;
          });
        },
      );
    } else if (widget.isASensitiveField &&
        loginController.obscurePassword.value == false) {
      output = IconButton(
          icon: const Icon(Icons.visibility, color: Colors.white),
          onPressed: () {
            setState(() {
              loginController.obscurePassword.value =
                  !loginController.obscurePassword.value;
            });
          });
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.08,
      width: Get.width,
      // margin: EdgeInsets.only(right: responsive.wp(2),left: responsive.wp(2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple.withOpacity(0),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Image(
              image: AssetImage(widget.image),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                obscureText: widget.isASensitiveField == true &&
                        loginController.obscurePassword.value == true
                    ? true
                    : false,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  suffixIcon: Image.asset(widget.image),
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                onChanged: widget.onChanged,
              ),
            )
          ],
        ),
      ),
    );
  }
}
