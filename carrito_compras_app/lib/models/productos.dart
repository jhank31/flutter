
class ProductoCatalogoModel {
    ProductoCatalogoModel({
        this.codigo,
        this.nombre,
        this.precio,
    });

    String? codigo;
    String? nombre;
    double? precio;

    factory ProductoCatalogoModel.fromJson(Map<String, dynamic> json) => ProductoCatalogoModel(
        codigo: json["codigo"],
        nombre: json["nombre"],
        precio: json["precio"],
    );

    Map<String, dynamic> toMap() => {
        "codigo": codigo,
        "nombre": nombre,
        "precio": precio,
    };
}