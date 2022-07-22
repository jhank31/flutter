import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String texto;

  // ignore: use_key_in_widget_constructors
  const CustomAppbar({required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                texto,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const Icon(
                Icons.search,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
