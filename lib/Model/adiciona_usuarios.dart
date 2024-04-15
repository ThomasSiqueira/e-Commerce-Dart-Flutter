import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/objectbox.g.dart';

int adicionaUsuario(Usuario u) {
  Box<Usuario> usuarioBox = ObjectBox.usuarioBox;

/////debug
  print(u.nome);
  print(u.email);
  print(u.senha);
////////

  //query.remove();

  ////////teste

  ////////
  return usuarioBox.put(u);
}
