import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Meta Gear',
    'Super Smash',
    'Final Fantasy'
  ];
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text('Listview 1'),
        )),
        body: ListView(children: [
          ...options
              .map((game) => ListTile(
                  title: Text(game),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined)))
              .toList()
        ]));
  }
}
