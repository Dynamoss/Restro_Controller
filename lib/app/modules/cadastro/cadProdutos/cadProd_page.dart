import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:resto_controller/app/models/produtos.dart';

import 'package:resto_controller/app/modules/produtos/prod_controller.dart';

class CadProdPage extends StatefulWidget {
  @override
  _CadProdPageState createState() => _CadProdPageState();
}

class _CadProdPageState extends State<CadProdPage> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Produtos produtos) {
    if (produtos != null) {
      _formData['id'] = produtos.id;
      _formData['nome'] = produtos.nome;
      _formData['quantidade'] = produtos.quantidade;
      _formData['valorProduto'] = produtos.valorProduto;

      _formData['avatarUrl'] = produtos.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Produtos produtos = ModalRoute.of(context).settings.arguments;

    _loadFormData(produtos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Center(
            child: Text(
          'Cadastro de Produtos',
          textAlign: TextAlign.center,
        )),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.save();

                Provider.of<ProdController>(context, listen: false).put(
                  Produtos(
                    id: _formData['id'],
                    nome: _formData['nome'],
                    quantidade: _formData['quantidade'],
                    valorProduto: _formData['valorProduto'],
                    avatarUrl: _formData['avatarUrl'],
                  ),
                );
                Navigator.of(context).pop();
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['quantidade'],
                decoration: InputDecoration(labelText: 'Quantidade'),
                onSaved: (value) => _formData['quantidade'] = value,
              ),
              TextFormField(
                initialValue: _formData['valorProduto'],
                decoration: InputDecoration(labelText: 'Valor do Produto'),
                onSaved: (value) => _formData['valorProduto'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'Url do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
