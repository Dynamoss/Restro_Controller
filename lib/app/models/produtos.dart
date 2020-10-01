import 'package:flutter/material.dart';

class Produtos {
  final String id;
  final String nome;
  final String quantidade;
  final String valorProduto;
  final String avatarUrl;

  const Produtos({
    this.id,
    @required this.nome,
    @required this.quantidade,
    @required this.valorProduto,
    @required this.avatarUrl,
  });
}
