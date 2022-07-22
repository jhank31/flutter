import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_x/pages/home_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // de esta manera se puede hacer una navegacion entre pantallas

    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      //con get.to se puede regresar a la pagina anterior
      //con get.off no se puede regresar a la pagina anterior
      Get.off(HomePage(), transition: Transition.zoom);
    });
  }

  //con esta funcion se pueden terminar procesos, como terminar un audio
  @override
  void onClose() {
    super.onClose();
  }
}
