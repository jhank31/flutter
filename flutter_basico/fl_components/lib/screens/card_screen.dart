import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets_export.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Tarjetas'),
          ),
        ),
        //asi se hace una card
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType1(),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              imageUrl:
                  'https://images.pexels.com/photos/1327373/pexels-photo-1327373.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              name: 'Mar paisaje',
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              imageUrl:
                  'https://images.pexels.com/photos/1327335/pexels-photo-1327335.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              name: 'Montaña paisaje',
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              imageUrl:
                  'https://images.pexels.com/photos/247599/pexels-photo-247599.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              name: 'Machupichu',
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              imageUrl:
                  'https://images.pexels.com/photos/853199/pexels-photo-853199.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ));
  }
}
