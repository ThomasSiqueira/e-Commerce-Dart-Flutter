import 'package:objectbox/objectbox.dart';

@Entity()
class Usuario {
  @Id()
  int? id;
  final String nome;
  final String senha;
  final String email;

  Usuario(
      {this.id,
      required this.nome,
      required this.senha,
      required this.email});
}
