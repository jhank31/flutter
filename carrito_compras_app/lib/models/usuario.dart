class UsuarioModel {
  final String?  usuario;
  final String? password;
  final String? empresa;

  UsuarioModel({ this.usuario,  this.password, this.empresa});

  Map<String, dynamic> toMap() {
    return {'usuario': usuario, 'password': password, 'empresa': empresa};
  }

  factory UsuarioModel.fromJson(Map<String, dynamic> data) => UsuarioModel(
      usuario: data['ususario'],
      password: data['password'],
      empresa: data['empresa']);
}