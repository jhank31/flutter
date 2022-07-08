import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsServices extends ChangeNotifier {
  final String _baseUrl =
      'flutter-varios-proyectos-4a3d0-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;
  bool isSaving = false;
  late Product selectedProduct;
  File? newPictureFile;

  ProductsServices() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    //esta linea notifica a todos los widgets interesados que hay algun cambio y que lo que se esta cargando esta en true
    isLoading = true;
    notifyListeners();
    //aqui el loadProducts hace la peticion al endpoint 'products,json'
    final url = Uri.https(_baseUrl, 'products.json');
    //aqui se almacena la respuesta de la peticion en res
    final res = await http.get(url);
    // y por ultimo esa respuesta se convierte en un mapa o diccionario
    final Map<String, dynamic> productsMap = json.decode(res.body);
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });
    //aqui se notifica de que ya se trajeron los datos necesarios y que el isLoading ya esta en false porque ya se cargaron todos los productos
    isLoading = false;
    notifyListeners();
    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();
    if (product.id == null) {
      //es necesario crear
      await createProduct(product);
    } else {
      // actualizar
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final res = await http.put(url, body: product.toJson());
    final decodedData = res.body;
    //esto nos ayuda a saber cual es el id del producto que debemos actualizar
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final res = await http.post(url, body: product.toJson());
    final decodedData = json.decode(res.body);
    product.id = decodedData['name'];
    products.add(product);

    return product.id!;
  }

  void updateSelectedImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;
    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dayuekskj/image/upload?upload_preset=hdupd2ij');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('field', newPictureFile!.path);

    imageUploadRequest.files.add(file);
    final streamRespose = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamRespose);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return null;
    }
    newPictureFile = null;
    final decodeData = json.decode(resp.body);
    return decodeData['secure_url'];
  }
}
