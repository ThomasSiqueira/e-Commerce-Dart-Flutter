import 'package:objectbox/objectbox.dart';

@Entity()
class Produto {
  @Id()
  int? id;
  final String nome;
  final List<String> tags;
  final double precoBase;
  final String imagem;

  Produto(
      {this.id = -1,
      required this.nome,
      required this.tags,
      required this.precoBase,
      required this.imagem});
}
