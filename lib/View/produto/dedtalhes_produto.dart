import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/Model/carrinho.dart';

class DetalhesProdutoPage extends StatefulWidget {
  final Produto produto;

  const DetalhesProdutoPage({Key? key, required this.produto})
      : super(key: key);

  @override
  _DetalhesProdutoPageState createState() => _DetalhesProdutoPageState();
}

class _DetalhesProdutoPageState extends State<DetalhesProdutoPage> {
  int quantidadeSelecionada = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image(
                image: AssetImage(widget.produto.imagem),
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.produto.nome,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'R\$ ${widget.produto.precoBase.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Descrição:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "descricao",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantidade:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                DropdownButton<int>(
                  value: quantidadeSelecionada,
                  items: List.generate(10, (index) => index + 1)
                      .map((value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      quantidadeSelecionada = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // pegar usuario logado
                Carrinho.addProduto(widget.produto, quantidadeSelecionada);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Adicionado ao carrinho: ${widget.produto.nome} (Quantidade: $quantidadeSelecionada)'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text(
                "Adicionar ao Carrinho",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
