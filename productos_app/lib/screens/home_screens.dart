import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'Home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('HomeScreen'),
      ),
    );
  }
}