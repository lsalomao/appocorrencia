import 'package:mobx/mobx.dart';
part 'ocorrencia_model.g.dart';

class OcorrenciaModel = _OcorrenciaModelBase with _$OcorrenciaModel;

abstract class _OcorrenciaModelBase with Store {
  _OcorrenciaModelBase(
      {this.id,
      this.descricao,
      this.km,
      this.rodovia,
      this.sentido,
      this.tipo,
      this.usuarioId,
      this.dhTimestamp});
  @observable
  int id;

  @observable
  String rodovia;
  @action
  changeRodovia(String value) => rodovia = value;

  @observable
  String km;
  @action
  changeKm(String value) => km = value;

  @observable
  String sentido;
  @action
  changeSentido(String value) => sentido = value;

  @observable
  String descricao;
  @action
  changeDescricao(String value) => descricao = value;

  @observable
  String tipo;
  @action
  changeTipo(String value) => tipo = value;

  @observable
  DateTime dhTimestamp;

  @observable
  bool sincronizado;

  @observable
  String dhSincronizacao;

  int usuarioId;

  String validarRodovia() {
    if (rodovia == null || rodovia.isEmpty) {
      return "obrigatório";
    }
    return null;
  }

  String validarKm() {
    if (km == null || km.isEmpty) {
      return "obrigatório";
    }
    return null;
  }

  String validarSentido() {
    if (sentido == null || sentido.isEmpty) {
      return "obrigatório";
    }
    return null;
  }

  String validarDescricao() {
    if (descricao == null || descricao.isEmpty) {
      return "obrigatório";
    }
    return null;
  }

  String validarTipo() {
    if (tipo == null || tipo.isEmpty || tipo == 'Tipo Ocorrência') {
      return "obrigatório";
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuarioId'] = this.usuarioId;
    data['tipo'] = this.tipo;
    data['rodovia'] = this.rodovia;
    data['km'] = this.km;
    data['sentido'] = this.sentido;
    data['descricao'] = this.descricao;
    data['dhTimestamp'] = this.dhTimestamp.toIso8601String();
    return data;
  }
}
