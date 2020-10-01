import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:resto_controller/app/models/fornecedores.dart';
import 'package:resto_controller/app/modules/fornecedores/forn_controller.dart';

class FornWidget extends StatelessWidget {
  final Fornecedores forn;
  const FornWidget(this.forn);

  @override
  Widget build(BuildContext context) {
    final avatar = forn.avatarUrl == null || forn.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(forn.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(forn.nome),
      subtitle: Text(forn.produtoVendido),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue[300],
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/cad-forn',
                  arguments: forn,
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
                          Provider.of<FornController>(context, listen: false)
                              .remove(forn);
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
    );
  }
}
