import 'package:flutter/material.dart';

class VarFixas extends ChangeNotifier{

  bool _passou;
  get passouget => _passou;
  set passouset(bool value){
    _passou = value;
    notifyListeners();
  }

}


