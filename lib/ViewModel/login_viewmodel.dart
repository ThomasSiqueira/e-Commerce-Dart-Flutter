import 'package:ecom_mobile/View/login/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

Future<String?> validateEmailBeingUsed(String email) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return 'Este email já está em uso. Por favor, use outro email.';
    }

    return null;
  }

void logout() {
    FirebaseAuth.instance.signOut();
}
