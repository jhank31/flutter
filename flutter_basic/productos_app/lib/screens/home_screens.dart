import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/widgets/widgets.dart';
import '../models/models.dart';
import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsServices>(context);
    final authServices = Provider.of<AuthServices>(context, listen: false);

    if (productService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.login_outlined),
          onPressed: () {
            authServices.logout();
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          },
        ),
        centerTitle: true,
        title: const Center(
          child: Text('Productos'),
        ),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                productService.selectedProduct =
                    productService.products[index].copy();
                Navigator.pushNamed(context, ProductScreen.routeName);
              },
              child: ProductCard(
                product: productService.products[index],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productService.selectedProduct =
              Product(available: false, price: 0.0, name: '');
          Navigator.pushNamed(context, ProductScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
