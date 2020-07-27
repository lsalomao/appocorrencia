// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_LoginControllerBase.isValid'))
      .value;

  final _$mensagemErroLoginAtom =
      Atom(name: '_LoginControllerBase.mensagemErroLogin');

  @override
  String get mensagemErroLogin {
    _$mensagemErroLoginAtom.reportRead();
    return super.mensagemErroLogin;
  }

  @override
  set mensagemErroLogin(String value) {
    _$mensagemErroLoginAtom.reportWrite(value, super.mensagemErroLogin, () {
      super.mensagemErroLogin = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$obscureTextAtom = Atom(name: '_LoginControllerBase.obscureText');

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  final _$loginEmailPasswordAsyncAction =
      AsyncAction('_LoginControllerBase.loginEmailPassword');

  @override
  Future<dynamic> loginEmailPassword() {
    return _$loginEmailPasswordAsyncAction
        .run(() => super.loginEmailPassword());
  }

  @override
  String toString() {
    return '''
mensagemErroLogin: ${mensagemErroLogin},
loading: ${loading},
obscureText: ${obscureText},
isValid: ${isValid}
    ''';
  }
}
