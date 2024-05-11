import 'package:firebase_auth/firebase_auth.dart';

Future<String> novoLogin(String _email, String _password) async {
  String _errorMessage = '';

  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    );
    
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      _errorMessage = 'Credenciais inválidas';
    } else {
      _errorMessage = 'Erro ao autenticar: ${e.message}';
    }
  } catch (e) {
    _errorMessage = 'Erro ao autenticar: $e';
  }

  return _errorMessage;
}

void logout() {
    FirebaseAuth.instance.signOut();
}
