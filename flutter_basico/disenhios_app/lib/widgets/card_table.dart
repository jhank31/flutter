import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(
            icon: Icons.border_all,
            text: 'General',
            color: Colors.blue,
          ),
          _SingleCard(
            icon: Icons.car_rental,
            text: 'Transport',
            color: Colors.purpleAccent,
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            icon: Icons.shopping_bag_outlined,
            text: 'Shopping',
            color: Colors.pink,
          ),
          _SingleCard(
            icon: Icons.document_scanner_outlined,
            text: 'Bills',
            color: Colors.orangeAccent,
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            icon: Icons.border_all,
            text: 'Entertaiment',
            color: Colors.blueAccent,
          ),
          _SingleCard(
            icon: Icons.car_rental,
            text: 'Grocery',
            color: Colors.greenAccent,
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            icon: Icons.music_note_outlined,
            text: 'Music',
            color: Colors.brown,
          ),
          _SingleCard(
            icon: Icons.car_rental,
            text: 'Video',
            color: Colors.teal,
          ),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const _SingleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 67, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: color,
                  child: Icon(
                    icon,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: TextStyle(color: color, fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
