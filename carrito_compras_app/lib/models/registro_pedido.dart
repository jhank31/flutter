class PedidosModel {
  PedidosModel({this.cliente, this.descripcion, this.date});

  String? cliente;
  String? descripcion;
  String? date;

  factory PedidosModel.fromJson(Map<String, dynamic> data) => PedidosModel(
      cliente: data['cliente'],
      descripcion: data['descripcion'],
      date: data['date']);

  Map<String, dynamic> toMap() {
    return {'cliente': cliente, 'detalle': descripcion, 'date': date};
  }
}
