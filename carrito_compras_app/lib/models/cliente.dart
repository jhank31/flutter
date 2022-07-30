class ClienteModel {
    ClienteModel({
        this.codigo,
        this.nombre,
        this.nit,
        this.ciudad,
        this.telefono,
    });

    String? codigo;
    String? nombre;
    String? nit;
    String? ciudad;
    String? telefono;

    factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
        codigo: json["codigo"],
        nombre: json["nombre"],
        nit: json["nit"],
        ciudad: json["ciudad"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
        "nit": nit,
        "ciudad": ciudad,
        "telefono": telefono,
    };
}

