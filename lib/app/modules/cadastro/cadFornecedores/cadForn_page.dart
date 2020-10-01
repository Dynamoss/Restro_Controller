import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_controller/app/models/fornecedores.dart';
import 'package:resto_controller/app/modules/fornecedores/forn_controller.dart';

class CadFornPage extends StatefulWidget {
  @override
  _CadFornPageState createState() => _CadFornPageState();
}

class _CadFornPageState extends State<CadFornPage> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Fornecedores fornecedor) {
    if (fornecedor != null) {
      _formData['id'] = fornecedor.id;
      _formData['nome'] = fornecedor.nome;
      _formData['produtoVendido'] = fornecedor.produtoVendido;
      _formData['avatarUrl'] = fornecedor.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Fornecedores fornecedor = ModalRoute.of(context).settings.arguments;

    _loadFormData(fornecedor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Cadastro de Fornecedores',
          textAlign: TextAlign.center,
        )),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.save();

                Provider.of<FornController>(context, listen: false).put(
                  Fornecedores(
                    id: _formData['id'],
                    nome: _formData['nome'],
                    produtoVendido: _formData['produtoVendido'],
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
                initialValue: _formData['produtoVendido'],
                decoration: InputDecoration(labelText: 'Produto Vendido'),
                onSaved: (value) => _formData['produtoVendido'] = value,
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
