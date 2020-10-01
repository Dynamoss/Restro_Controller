import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'package:resto_controller/app/data/dummy_fornecedores.dart';
import 'package:resto_controller/app/models/fornecedores.dart';

class FornController with ChangeNotifier {
  Map<String, Fornecedores> _items = {...DUMMY_FORNECEDORES};

  List<Fornecedores> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Fornecedores byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Fornecedores fornecedores) {
    if (fornecedores == null) {
      return;
    }
    // alterar

    if (fornecedores.id != null &&
        fornecedores.id.trim().isNotEmpty &&
        _items.containsKey(fornecedores.id)) {
      _items.update(fornecedores.id, (_) => fornecedores);
    } else {
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Fornecedores(
            id: id,
            nome: fornecedores.nome,
            produtoVendido: fornecedores.produtoVendido,
            avatarUrl: fornecedores.avatarUrl),
      );
    }

    notifyListeners();
  }

  void remove(Fornecedores fornecedores) {
    if (fornecedores != null && fornecedores.id != null) {
      _items.remove(fornecedores.id);
      notifyListeners();
    }
  }
}
