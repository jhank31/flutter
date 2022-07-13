import 'package:flutter/material.dart';

class BasicDesingScreen extends StatelessWidget {
  const BasicDesingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //imagen central
        const Image(image: AssetImage('assets/img/landscape.jpg')),
        //titulo
        const Title(),
        //Button Section
        const ButtonSection(),
        // descripcion
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: const Text(
              'Commodo laborum ipsum adipisicing aliquip do nulla cillum. Irure quis esse sunt adipisicing qui nostrud exercitation. Voluptate officia ipsum qui consectetur sunt. Sit qui eiusmod esse reprehenderit velit ipsum ipsum cupidatat dolore duis et anim id. Laborum ipsum veniam eu ullamco irure in in exercitation consectetur dolore tempor amet. Pariatur culpa aliqua ad est culpa do labore incididunt ea nulla labore dolor.'),
        )
      ],
    ));
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.black45)),
            ],
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.star_border_outlined,
            color: Colors.red,
          ),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomButton(
            text: 'CALL',
            icon: Icons.call,
          ),
          CustomButton(
            text: 'ROUTE',
            icon: Icons.map_rounded,
          ),
          CustomButton(
            text: 'SHARE',
            icon: Icons.share,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.lightBlue,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(color: Colors.lightBlue),
        )
      ],
    );
  }
}
