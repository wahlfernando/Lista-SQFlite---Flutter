
class DadosExercicios{

  int _id;
  String _nome;
  String _series;
  String _repeticoes;
  String _carga;
  String _realizado;
  String _treino;

  DadosExercicios(this._nome, this._series, this._repeticoes, this._carga, this._treino, [this._realizado]);
  DadosExercicios.withId(this._id, this._nome, this._series, this._repeticoes, this._carga, this._treino, [this._realizado]);


  int get id => _id;
  String get nome => _nome;
  String get series => _series;
  String get repeticoes => _repeticoes;
  String get carga => _carga;
  String get realizado => _realizado;
  String get treino => _treino;


  set nome(String newText) {
    if(newText.length <= 255){
      _nome = newText;
    }
  }
  set series(String newText) {
    if(newText.length <= 255){
      _series = newText;
    }
  }
  set repeticoes(String newText) {
    if(newText.length <= 255){
      _repeticoes = newText;
    }
  }
  set carga(String newText) {
    if(newText.length <= 255){
      _carga = newText;
    }
  }
  set realizado(String newText) {
    if(newText.length <= 255){
      _realizado = newText;
    }
  }
  set treino(String newText) {
    if(newText.length <= 255){
      _treino = newText;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['nome'] = _nome;
    map['series'] = _series;
    map['repeticoes'] = _repeticoes;
    map['carga'] = _carga;
    map['realizado'] = _realizado;
    map['treino'] = _treino;
    return map;
  }


  DadosExercicios.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nome = map['nome'];
    this._series = map['series'];
    this._repeticoes = map['repeticoes'];
    this._carga = map['carga'];
    this._realizado = map['realizado'];
    this._treino = map['treino'];
  }


}