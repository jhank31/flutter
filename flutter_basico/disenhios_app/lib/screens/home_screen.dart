import 'package:disenhios_app/widgets/card_table.dart';
import 'package:disenhios_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //background
        const BackgroundWidget(),
        //homeBody
        _HomeBody(),
      ]),
      //bottomNavigationBar
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          //titles
          PageTitle(),
          //card table
          CardTable(),
        ],
      ),
    );
  }
}
