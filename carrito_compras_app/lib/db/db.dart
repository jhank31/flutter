// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart' show dirname, join;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'DataBaseCopy.db');

    print(path);

    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "DataBase3.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    // Creamos la Base de Datos
    return await openDatabase(path, version: 1);

   
  }

  Future<UsuarioModel> getUsuario() async {
    final db = await database;
    try {
      var sql = await db.rawQuery(''' 

      SELECT usuario, password, empresa 
      FROM Usuario

     ''');
      return sql.isNotEmpty ? UsuarioModel.fromJson(sql.first) : UsuarioModel();
    } catch (e) {
      return UsuarioModel();
    }
  }

  Future<VendedorModel> getVendedor() async {
    final db = await database;
    try {
      var sql = await db.rawQuery(''' 

      SELECT codigo, nombre, empresa 
      FROM Vendedor

     ''');
      return sql.isNotEmpty
          ? VendedorModel.fromJson(sql.first)
          : VendedorModel();
    } catch (e) {
      return VendedorModel();
    }
  }

  Future<List<ClienteModel>> getClientes(
      VendedorModel vendedorLogueado) async {
    final db = await database;
    try {
      var sql = await db.rawQuery(''' 

      SELECT Codigo as codigo, Nombre as nombre, Nit as nit, Ciudad as ciudad, Telefono as telefono 
      FROM Clientes
      WHERE Vendedor1 = ${vendedorLogueado.codigo} 

     ''');
      return sql.isNotEmpty
          ? sql.map((valor) => ClienteModel.fromJson(valor)).toList()
          : [];
    } catch (e) {
      return [];
    }
  }

  Future<List<ProductoCatalogoModel>> obtenerProductosCatalogo() async {
    final db = await database;
    try {
      var sql = await db.rawQuery(''' 

      SELECT Codigo as codigo, Nombre as nombre, Precio *  (100 + Iva) / 100  as precio
      FROM ProductosCatalogo
      

     ''');
      return sql.isNotEmpty
          ? sql.map((valor) => ProductoCatalogoModel.fromJson(valor)).toList()
          : [];
    } catch (e) {
      return [];
    }
  }

  Future<void> crearTablaRegistroPedidos() async {
    final db = await database;
    try {
      await db.execute('''
      CREATE TABLE RegistroPedidos (
        Fecha TEXT ,
        Cliente TEXT,
        Detalle TEXT
      )
      ''');
    } catch (e) {
      print(e);
    }
  }

  Future<bool> guardarPedido(PedidosModel registroPedido) async {
    final db = await database;

    try {
      await db.rawInsert('''
        INSERT INTO RegistroPedidos(Fecha, Cliente, Detalle)
        VALUES
         ('${registroPedido.date}', '${registroPedido.cliente}','${registroPedido.descripcion}')
    ''');
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }
}
