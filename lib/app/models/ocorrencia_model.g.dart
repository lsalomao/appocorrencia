// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocorrencia_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OcorrenciaModel on _OcorrenciaModelBase, Store {
  final _$idAtom = Atom(name: '_OcorrenciaModelBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$rodoviaAtom = Atom(name: '_OcorrenciaModelBase.rodovia');

  @override
  String get rodovia {
    _$rodoviaAtom.reportRead();
    return super.rodovia;
  }

  @override
  set rodovia(String value) {
    _$rodoviaAtom.reportWrite(value, super.rodovia, () {
      super.rodovia = value;
    });
  }

  final _$kmAtom = Atom(name: '_OcorrenciaModelBase.km');

  @override
  String get km {
    _$kmAtom.reportRead();
    return super.km;
  }

  @override
  set km(String value) {
    _$kmAtom.reportWrite(value, super.km, () {
      super.km = value;
    });
  }

  final _$sentidoAtom = Atom(name: '_OcorrenciaModelBase.sentido');

  @override
  String get sentido {
    _$sentidoAtom.reportRead();
    return super.sentido;
  }

  @override
  set sentido(String value) {
    _$sentidoAtom.reportWrite(value, super.sentido, () {
      super.sentido = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_OcorrenciaModelBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$tipoAtom = Atom(name: '_OcorrenciaModelBase.tipo');

  @override
  String get tipo {
    _$tipoAtom.reportRead();
    return super.tipo;
  }

  @override
  set tipo(String value) {
    _$tipoAtom.reportWrite(value, super.tipo, () {
      super.tipo = value;
    });
  }

  final _$sincronizadoAtom = Atom(name: '_OcorrenciaModelBase.sincronizado');

  @override
  bool get sincronizado {
    _$sincronizadoAtom.reportRead();
    return super.sincronizado;
  }

  @override
  set sincronizado(bool value) {
    _$sincronizadoAtom.reportWrite(value, super.sincronizado, () {
      super.sincronizado = value;
    });
  }

  final _$dhSincronizacaoAtom =
      Atom(name: '_OcorrenciaModelBase.dhSincronizacao');

  @override
  String get dhSincronizacao {
    _$dhSincronizacaoAtom.reportRead();
    return super.dhSincronizacao;
  }

  @override
  set dhSincronizacao(String value) {
    _$dhSincronizacaoAtom.reportWrite(value, super.dhSincronizacao, () {
      super.dhSincronizacao = value;
    });
  }

  final _$_OcorrenciaModelBaseActionController =
      ActionController(name: '_OcorrenciaModelBase');

  @override
  dynamic changeRodovia(String value) {
    final _$actionInfo = _$_OcorrenciaModelBaseActionController.startAction(
        name: '_OcorrenciaModelBase.changeRodovia');
    try {
      return super.changeRodovia(value);
    } finally {
      _$_OcorrenciaModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeKm(String value) {
    final _$actionInfo = _$_OcorrenciaModelBaseActionController.startAction(
        name: '_OcorrenciaModelBase.changeKm');
    try {
      return super.changeKm(value);
    } finally {
      _$_OcorrenciaModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSentido(String value) {
    final _$actionInfo = _$_OcorrenciaModelBaseActionController.startAction(
        name: '_OcorrenciaModelBase.changeSentido');
    try {
      return super.changeSentido(value);
    } finally {
      _$_OcorrenciaModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescricao(String value) {
    final _$actionInfo = _$_OcorrenciaModelBaseActionController.startAction(
        name: '_OcorrenciaModelBase.changeDescricao');
    try {
      return super.changeDescricao(value);
    } finally {
      _$_OcorrenciaModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTipo(String value) {
    final _$actionInfo = _$_OcorrenciaModelBaseActionController.startAction(
        name: '_OcorrenciaModelBase.changeTipo');
    try {
      return super.changeTipo(value);
    } finally {
      _$_OcorrenciaModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
rodovia: ${rodovia},
km: ${km},
sentido: ${sentido},
descricao: ${descricao},
tipo: ${tipo},
sincronizado: ${sincronizado},
dhSincronizacao: ${dhSincronizacao}
    ''';
  }
}
