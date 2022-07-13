import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            subtitle: Text(
                'Ea nisi veniam dolor excepteur aute deserunt officia ad labore amet minim aliquip aute do. Nisi sunt quis ipsum do sunt nulla adipisicing enim culpa. Deserunt veniam fugiat ipsum labore velit.'),
            leading: Icon(
              Icons.photo_album_outlined,
              color: AppTheme.primary,
            ),
            title: Text('Soy un titulo'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                TextButton(onPressed: () {}, child: const Text('Ok'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
