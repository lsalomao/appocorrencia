// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_ocorrencia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormOcorrenciaController on _FormOcorrenciaControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_FormOcorrenciaControllerBase.isValid'))
      .value;

  final _$fileImagemAtom =
      Atom(name: '_FormOcorrenciaControllerBase.fileImagem');

  @override
  File get fileImagem {
    _$fileImagemAtom.reportRead();
    return super.fileImagem;
  }

  @override
  set fileImagem(File value) {
    _$fileImagemAtom.reportWrite(value, super.fileImagem, () {
      super.fileImagem = value;
    });
  }

  final _$tipoOcorrenciaSelecionadaAtom =
      Atom(name: '_FormOcorrenciaControllerBase.tipoOcorrenciaSelecionada');

  @override
  String get tipoOcorrenciaSelecionada {
    _$tipoOcorrenciaSelecionadaAtom.reportRead();
    return super.tipoOcorrenciaSelecionada;
  }

  @override
  set tipoOcorrenciaSelecionada(String value) {
    _$tipoOcorrenciaSelecionadaAtom
        .reportWrite(value, super.tipoOcorrenciaSelecionada, () {
      super.tipoOcorrenciaSelecionada = value;
    });
  }

  final _$tiposOcorrenciaAtom =
      Atom(name: '_FormOcorrenciaControllerBase.tiposOcorrencia');

  @override
  List<String> get tiposOcorrencia {
    _$tiposOcorrenciaAtom.reportRead();
    return super.tiposOcorrencia;
  }

  @override
  set tiposOcorrencia(List<String> value) {
    _$tiposOcorrenciaAtom.reportWrite(value, super.tiposOcorrencia, () {
      super.tiposOcorrencia = value;
    });
  }

  final _$ocorrenciaModelAtom =
      Atom(name: '_FormOcorrenciaControllerBase.ocorrenciaModel');

  @override
  OcorrenciaModel get ocorrenciaModel {
    _$ocorrenciaModelAtom.reportRead();
    return super.ocorrenciaModel;
  }

  @override
  set ocorrenciaModel(OcorrenciaModel value) {
    _$ocorrenciaModelAtom.reportWrite(value, super.ocorrenciaModel, () {
      super.ocorrenciaModel = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_FormOcorrenciaControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$initEditAsyncAction =
      AsyncAction('_FormOcorrenciaControllerBase.initEdit');

  @override
  Future initEdit() {
    return _$initEditAsyncAction.run(() => super.initEdit());
  }

  final _$changeImageAsyncAction =
      AsyncAction('_FormOcorrenciaControllerBase.changeImage');

  @override
  Future<void> changeImage() {
    return _$changeImageAsyncAction.run(() => super.changeImage());
  }

  final _$salvarOcorrenciaAsyncAction =
      AsyncAction('_FormOcorrenciaControllerBase.salvarOcorrencia');

  @override
  Future<dynamic> salvarOcorrencia() {
    return _$salvarOcorrenciaAsyncAction.run(() => super.salvarOcorrencia());
  }

  final _$_FormOcorrenciaControllerBaseActionController =
      ActionController(name: '_FormOcorrenciaControllerBase');

  @override
  dynamic changeTipoOcorrenciaSelecionada(String value) {
    final _$actionInfo =
        _$_FormOcorrenciaControllerBaseActionController.startAction(
            name:
                '_FormOcorrenciaControllerBase.changeTipoOcorrenciaSelecionada');
    try {
      return super.changeTipoOcorrenciaSelecionada(value);
    } finally {
      _$_FormOcorrenciaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fileImagem: ${fileImagem},
tipoOcorrenciaSelecionada: ${tipoOcorrenciaSelecionada},
tiposOcorrencia: ${tiposOcorrencia},
ocorrenciaModel: ${ocorrenciaModel},
isValid: ${isValid}
    ''';
  }
}
