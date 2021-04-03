import 'package:academia/todo.dart';
import 'package:flutter/material.dart';

class Manager extends ChangeNotifier {

  List<DadosExercicios> allExercicios = [];

  String _search = '';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  String _acatreino = 'A';

  String get acatreino => _acatreino;

  set acatreino(String value) {
    acatreino = value;
    notifyListeners();
  }





  List<DadosExercicios> get filteredExercicios {
    final List<DadosExercicios> filteredProducts = [];
    if (search.isEmpty) {
      filteredProducts.addAll(allExercicios);
    } else {
      filteredProducts.addAll(allExercicios
          .where((p) => p.nome.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredProducts;
  }
}

