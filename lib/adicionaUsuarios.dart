import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/objectbox.g.dart';

init(Usuario u) async {
  Box<Usuario> usuarioBox = ObjectBox.usuarioBox;
 
  final query = usuarioBox.query().build();
  final usuarios = query.find();
  //query.remove();
  usuarioBox.put(u);

  for (Usuario usuario in usuarios) {
    print(usuario.nome);
    print(usuario.email);
    print(usuario.senha);
  }
}
