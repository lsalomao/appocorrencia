// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appconfig_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppConfigModel on _AppConfigModelBase, Store {
  final _$isDarkAtom = Atom(name: '_AppConfigModelBase.isDark');

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  final _$_AppConfigModelBaseActionController =
      ActionController(name: '_AppConfigModelBase');

  @override
  dynamic changeThemeSwitch(bool value) {
    final _$actionInfo = _$_AppConfigModelBaseActionController.startAction(
        name: '_AppConfigModelBase.changeThemeSwitch');
    try {
      return super.changeThemeSwitch(value);
    } finally {
      _$_AppConfigModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDark: ${isDark}
    ''';
  }
}
