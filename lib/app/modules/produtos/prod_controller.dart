import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'package:resto_controller/app/data/dummy_produtos.dart';

import 'package:resto_controller/app/models/produtos.dart';

class ProdController with ChangeNotifier {
  Map<String, Produtos> _items = {...DUMMY_PRODUTOS};

  List<Produtos> get all {
    return [..._items.values];
  }

  int get count2 {
    return _items.length;
  }

  Produtos byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Produtos produtos) {
    if (produtos == null) {
      return;
    }
    // alterar

    if (produtos.id != null &&
        produtos.id.trim().isNotEmpty &&
        _items.containsKey(produtos.id)) {
      _items.update(produtos.id, (_) => produtos);
    } else {
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Produtos(
            id: id,
            nome: produtos.nome,
            quantidade: produtos.quantidade,
            valorProduto: produtos.valorProduto,
            avatarUrl: produtos.avatarUrl),
      );
    }

    notifyListeners();
  }

  void remove(Produtos produtos) {
    if (produtos != null && produtos.id != null) {
      _items.remove(produtos.id);
      notifyListeners();
    }
  }
}
