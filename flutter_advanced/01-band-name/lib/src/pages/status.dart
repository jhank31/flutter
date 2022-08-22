import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_application/src/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketServices = Provider.of<SocketServices>(context);

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Serverstatus: ${socketServices.serverStatus} "),
        ],
      )),
    );
  }
}
