import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = 'Product';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: const [
              ProductImage(),
            ],
          )
        ],
      ),
    ));
  }
}
