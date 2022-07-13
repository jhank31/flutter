import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'no data';
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Message')),
      ),
      body: Center(
        child: Text(
          '$args',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
