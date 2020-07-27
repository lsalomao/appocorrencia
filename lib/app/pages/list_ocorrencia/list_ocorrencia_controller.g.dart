// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_ocorrencia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListOcorrenciaController on _ListOcorrenciaControllerBase, Store {
  Computed<int> _$totalComputed;

  @override
  int get total => (_$totalComputed ??= Computed<int>(() => super.total,
          name: '_ListOcorrenciaControllerBase.total'))
      .value;

  final _$listItemsAtom = Atom(name: '_ListOcorrenciaControllerBase.listItems');

  @override
  ObservableList<OcorrenciaModel> get listItems {
    _$listItemsAtom.reportRead();
    return super.listItems;
  }

  @override
  set listItems(ObservableList<OcorrenciaModel> value) {
    _$listItemsAtom.reportWrite(value, super.listItems, () {
      super.listItems = value;
    });
  }

  final _$loadOcorrenciasAsyncAction =
      AsyncAction('_ListOcorrenciaControllerBase.loadOcorrencias');

  @override
  Future loadOcorrencias() {
    return _$loadOcorrenciasAsyncAction.run(() => super.loadOcorrencias());
  }

  final _$removerOcorrenciaAsyncAction =
      AsyncAction('_ListOcorrenciaControllerBase.removerOcorrencia');

  @override
  Future removerOcorrencia(OcorrenciaModel model) {
    return _$removerOcorrenciaAsyncAction
        .run(() => super.removerOcorrencia(model));
  }

  final _$sincronizarOcorrenciasAsyncAction =
      AsyncAction('_ListOcorrenciaControllerBase.sincronizarOcorrencias');

  @override
  Future sincronizarOcorrencias() {
    return _$sincronizarOcorrenciasAsyncAction
        .run(() => super.sincronizarOcorrencias());
  }

  @override
  String toString() {
    return '''
listItems: ${listItems},
total: ${total}
    ''';
  }
}
