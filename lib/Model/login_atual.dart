import 'package:ecom_mobile/Model/usuario.dart';

class CondicaoLogin {
  static Usuario? usuario;

  static login(Usuario u) {
    usuario = u;
  }

  static logout() {
    usuario = null;
  }
  
}
