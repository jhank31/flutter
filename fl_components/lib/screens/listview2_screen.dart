import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Meta Gear',
    'Super Smash',
    'Final Fantasy'
  ];
  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
              child: Text('El Mundo de la Mascota'),
            ),
            backgroundColor: Colors.indigo),
        body: ListView.separated(
          itemCount: options.length,
          itemBuilder: (context, i) => ListTile(
            title: Text(options[i]),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.indigo,
            ),
            onTap: () {},
          ),
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
