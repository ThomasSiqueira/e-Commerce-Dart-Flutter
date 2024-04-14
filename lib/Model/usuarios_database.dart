import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/objectbox.g.dart';

List<Usuario> listarUsuarios() {
  Box<Usuario> userBox = ObjectBox.usuarioBox;
  final query = userBox.query().build();
  final usuarios = query.find();

  return usuarios;
}
