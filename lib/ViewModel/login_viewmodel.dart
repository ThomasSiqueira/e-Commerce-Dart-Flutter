import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/objectbox.g.dart';
import 'package:ecom_mobile/Model/login_atual.dart';

String novoLogin(
  _email,
  _password,
) {
  String _errorMessage = '';

  final usuarioInfo = ObjectBox.usuarioBox
      .query(Usuario_.email.equals(_email))
      .build()
      .findFirst();

  if (usuarioInfo != null) {
    if (_password != usuarioInfo.senha) {
      _errorMessage = 'Credenciais inválidas';
    }
    {
      CondicaoLogin.login(usuarioInfo);
    }
  } else {
    _errorMessage = 'Credenciais inválidas';
  }

  return _errorMessage;
}

void logout() {
  CondicaoLogin.logout();
}
