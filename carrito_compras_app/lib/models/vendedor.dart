class VendedorModel {
  VendedorModel({
    this.codigo,
    this.nombre,
    this.empresa,
  });

  String? codigo;
  String? nombre;
  String? empresa;

  factory VendedorModel.fromJson(Map<String, dynamic> json) => VendedorModel(
        codigo: json["codigo"],
        nombre: json["nombre"],
        empresa: json["empresa"],
      );

  Map<String, dynamic> toMap() => {
        "codigo": codigo,
        "nombre": nombre,
        "empresa": empresa,
      };
}
