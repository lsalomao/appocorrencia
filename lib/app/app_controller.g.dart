// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$appConfigModelAtom = Atom(name: '_AppControllerBase.appConfigModel');

  @override
  AppConfigModel get appConfigModel {
    _$appConfigModelAtom.reportRead();
    return super.appConfigModel;
  }

  @override
  set appConfigModel(AppConfigModel value) {
    _$appConfigModelAtom.reportWrite(value, super.appConfigModel, () {
      super.appConfigModel = value;
    });
  }

  @override
  String toString() {
    return '''
appConfigModel: ${appConfigModel}
    ''';
  }
}
