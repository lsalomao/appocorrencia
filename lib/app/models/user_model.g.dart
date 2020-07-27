// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserModel on _UserModelBase, Store {
  final _$emailAtom = Atom(name: '_UserModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_UserModelBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$localizacaoAtom = Atom(name: '_UserModelBase.localizacao');

  @override
  String get localizacao {
    _$localizacaoAtom.reportRead();
    return super.localizacao;
  }

  @override
  set localizacao(String value) {
    _$localizacaoAtom.reportWrite(value, super.localizacao, () {
      super.localizacao = value;
    });
  }

  final _$longitudeAtom = Atom(name: '_UserModelBase.longitude');

  @override
  String get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(String value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  final _$latitudeAtom = Atom(name: '_UserModelBase.latitude');

  @override
  String get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(String value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  final _$loggedInAtom = Atom(name: '_UserModelBase.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  final _$_UserModelBaseActionController =
      ActionController(name: '_UserModelBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction(
        name: '_UserModelBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSenha(String value) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction(
        name: '_UserModelBase.changeSenha');
    try {
      return super.changeSenha(value);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLocalizacao(String value) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction(
        name: '_UserModelBase.changeLocalizacao');
    try {
      return super.changeLocalizacao(value);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLongitude(String value) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction(
        name: '_UserModelBase.changeLongitude');
    try {
      return super.changeLongitude(value);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLatitude(String value) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction(
        name: '_UserModelBase.changeLatitude');
    try {
      return super.changeLatitude(value);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
localizacao: ${localizacao},
longitude: ${longitude},
latitude: ${latitude},
loggedIn: ${loggedIn}
    ''';
  }
}
