import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Avatar Screen')),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              child: const Text('JA'),
            ),
          )
        ],
      ),
      body: const Center(
          child: CircleAvatar(
        maxRadius: 150,
        backgroundImage: NetworkImage(
            'https://lh3.googleusercontent.com/PKf_ksJBiTe10xYYSgRi4dqrMZVzjrgUhO47gzcWbQPIFy-ZcpvusYaYIBGXDeESdqwjmR6S32sIhTZ2bHzU_-J4-GTDUisyCNdDAw=w600'),
      )),
    );
  }
}
