import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  int _counter = 0;

  int get counter => _counter;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void increment() {
    _counter++;
    update();
  }

  void decrement() {
    _counter--;
  }
}
