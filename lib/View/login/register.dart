import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/Model/usuarios_database.dart';
import 'package:ecom_mobile/adicionaUsuarios.dart';
import 'package:ecom_mobile/objectbox.g.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/View/login/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
   String _username = '';
   String _email = '';
   String _password = '';
   String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 60.0),
                      const Text(
                        "Registrar",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Criar Conta",
                        style:
                            TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Nome",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            fillColor: Color.fromARGB(255, 136, 129, 137)
                                .withOpacity(0.1),
                            filled: true,
                            prefixIcon: const Icon(Icons.person)),
                        onChanged: (value) {
                          _username = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu nome';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            fillColor: Color.fromARGB(255, 136, 129, 137)
                                .withOpacity(0.1),
                            filled: true,
                            prefixIcon: const Icon(Icons.email)),

                        onChanged: (value) {
                          _email = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Senha",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor:
                              Color.fromARGB(255, 136, 129, 137).withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                        
                        onChanged: (value) {
                          _password = value;
                        },

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                      
                         
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Confirmar Senha",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor:
                              Color.fromARGB(255, 136, 129, 137).withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          _confirmPassword = value;
                          print("confirmed:: $_confirmPassword");
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, confirme sua senha';
                          } else if (value != _password) {
                            return 'As senhas não coincidem';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                        final newUser = Usuario(
                          nome: _username,
                          email: _email,
                          senha: _password,
                        );

                        await init(newUser);
                        
                          // Box<Usuario> usuarioBox = ObjectBox.usuarioBox;    

                          // final query = usuarioBox.query().build();
                          // final usuarios = query.find();

                          // usuarioBox.put(newUser);

                          // for (Usuario usuario in usuarios) {
                          //   print(usuario.email);
                          // }
                        }
                      },
                      child: const Text(
                        "Confirmar",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors
                                .white), 
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Já tem uma conta?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                              return LoginPage();
                            }));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
