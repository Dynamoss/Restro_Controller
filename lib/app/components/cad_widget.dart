import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:resto_controller/app/models/produtos.dart';

import 'package:resto_controller/app/modules/produtos/prod_controller.dart';

class ProdWidget extends StatelessWidget {
  final Produtos prod;
  const ProdWidget(this.prod);

  @override
  Widget build(BuildContext context) {
    final avatar = prod.avatarUrl == null || prod.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(prod.avatarUrl));

    return Container(
      width: 100,
      child: ListTile(
        leading: avatar,
        title: Center(child: Text(prod.nome)),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: Text("Valor:" + prod.valorProduto),
            ),
            Text("Quantidade:" + prod.quantidade),
          ],
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.blue[300],
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/cad-prod',
                    arguments: prod,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Excluir Usuário'),
                      content: Text('Tem certeza??'),
                      actions: [
                        FlatButton(
                          child: Text('Não'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('Sim'),
                          onPressed: () {
                            Provider.of<ProdController>(context, listen: false)
                                .remove(prod);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
