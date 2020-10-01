import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class Fornecedores {
  final String id;
  final String nome;
  final String produtoVendido;
  final String avatarUrl;

  const Fornecedores({
    this.id,
    @required this.nome,
    @required this.produtoVendido,
    @required this.avatarUrl,
  });
}
