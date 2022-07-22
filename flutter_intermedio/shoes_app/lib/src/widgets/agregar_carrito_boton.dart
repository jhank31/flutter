// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;
  const AgregarCarritoBoton({required this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$monto',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const _AddToCarButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _AddToCarButton extends StatelessWidget {
  const _AddToCarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 150,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: const Color(0xfff1a23a),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: const Text(
          'Add to car',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
