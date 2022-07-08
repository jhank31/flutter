import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product product;
  ProductFormProvider(this.product);
//este metodo notifica cuando el switch esta activado y cuando no

  updateAvailability(bool value) {
    product.available = value;
    notifyListeners();
  }

//este metodo lo que hace es retornar si el formulario es valido o no
  bool isValideForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
