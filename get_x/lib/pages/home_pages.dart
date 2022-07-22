import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_x/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = HomeController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: _controller,
      builder: (_) => Scaffold(
        body: Center(
          child: Text(_.counter.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _.increment();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
