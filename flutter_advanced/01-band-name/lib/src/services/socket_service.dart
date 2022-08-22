import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

// ignore: constant_identifier_names
enum ServerStatus { Online, Offline, Connecting }

class SocketServices with ChangeNotifier {
  get serverStatus => _serverStatus;

  ServerStatus _serverStatus = ServerStatus.Connecting;

  SocketServices() {
    _initConfig();
  }

  void _initConfig() {
    IO.Socket socket = IO.io('http://192.168.1.74:3000/', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.on('connect', (_) {
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    socket.on('disconnect', (_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    socket.on('nuevo-mensaje', (payload) {
      print('nuevo-mensaje');
      print('nombre: ' + payload['nombre'] );
      print('mensaje: ' + payload['mensaje']);
      print(payload.containsKey('mensaje2') ? payload['mensaje2'] : 'no hay');
    });
  }
}
