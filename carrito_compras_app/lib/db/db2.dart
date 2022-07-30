/* import 'dart:io';
import 'package:carrito_compras_app/models/cliente.dart';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show dirname, join;

class DatabaseHelper {
  Future openDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'DataBase.db3');

    var exist = await databaseExists(path);
    if (!exist) {
      print('creating new copy from assets');

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "DataBase3.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
  }

  //instancia de base de datos
  final Future<Database> database = getDatabasesPath().then((String path) {
    return openDatabase(join(path, 'programa_nutricion.db'));
  });

  Future<List<UsuarioModel>> getUsuario() async {
    final Database db = await database;
    final List<Map<String, dynamic>> map = await db.query('Usuario');

    return List.generate(
        map.length,
        ((index) => UsuarioModel(
            usuario: map[index]['usuario'], password: map[index]['password'])));
  }

  Future<List<ClientesModel>> getCLientes() async {
    final Database db = await database;
    final List<Map<String, dynamic>> map = await db.rawQuery('SELECT Nit, Nombre  FROM Clientes ');


    return List.generate(
        map.length,
        ((index) => ClientesModel(
            nit: map[index]['Nit'], nombre: map[index]['Nombre'])));
  }
}
 */