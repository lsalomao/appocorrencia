import 'dart:io';

import 'package:app_ocorrencia/app/constantes/routes/app_routes.dart';
import 'package:app_ocorrencia/app/models/ocorrencia_model.dart';
import 'package:app_ocorrencia/app/shared/repositories/ocorrencia_repository_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'form_ocorrencia_controller.g.dart';

class FormOcorrenciaController = _FormOcorrenciaControllerBase with _$FormOcorrenciaController;

abstract class _FormOcorrenciaControllerBase with Store {
  final IOcorrenciaRepository ocorrenciaRepository = Modular.get<IOcorrenciaRepository>();
  TextEditingController rodoviaController = TextEditingController();
  TextEditingController kmController = TextEditingController();
  TextEditingController sentidoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  @action
  init() async {
    //ocorrenciaModel = OcorrenciaModel();
    rodoviaController.text = "localizando...";
    var localizacao = await ocorrenciaRepository.getLocalizacaoCompleta();
    rodoviaController.text = localizacao.thoroughfare + ' ' + localizacao.subThoroughfare;
    ocorrenciaModel.rodovia = localizacao.thoroughfare + ' ' + localizacao.subThoroughfare;
  }

  @action
  initEdit() async {
    rodoviaController.text = ocorrenciaModel.rodovia;
    kmController.text = ocorrenciaModel.km;
    sentidoController.text = ocorrenciaModel.sentido;
    descricaoController.text = ocorrenciaModel.descricao;
    changeTipoOcorrenciaSelecionada(ocorrenciaModel.tipo);
    isEdit = true;
  }

  @action
  changeTipoOcorrenciaSelecionada(String value) {
    tipoOcorrenciaSelecionada = value;
    ocorrenciaModel.changeTipo(value);
  }

  final picker = ImagePicker();

  @observable
  File fileImagem;

  @action
  Future<void> changeImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    fileImagem = File(pickedFile.path);
  }

  bool isEdit = false;

  bool operacaoRealizada = false;

  @observable
  String tipoOcorrenciaSelecionada = '';

  @observable
  List<String> tiposOcorrencia = ['Tipo Ocorrência', 'PMV', 'Buraco', 'Semáforo', 'Cancela'];

  @observable
  OcorrenciaModel ocorrenciaModel = OcorrenciaModel();

  @computed
  bool get isValid =>
      ocorrenciaModel.validarDescricao() == null &&
      ocorrenciaModel.validarKm() == null &&
      ocorrenciaModel.validarRodovia() == null &&
      ocorrenciaModel.validarSentido() == null &&
      ocorrenciaModel.validarTipo() == null;

  @action
  Future salvarOcorrencia() async {
    try {
      if (isValid) {
        if (!isEdit) {
          operacaoRealizada = await ocorrenciaRepository.insert(ocorrenciaModel);
          if (operacaoRealizada) {
            Modular.to.pushReplacementNamed(AppRoutes.LIST_OCORRENCIA);
          } else {
            print('erro');
          }
        } else {
          operacaoRealizada = await ocorrenciaRepository.update(ocorrenciaModel);
          if (operacaoRealizada) {
            Modular.to.pushReplacementNamed(AppRoutes.LIST_OCORRENCIA);
          }
        }
      }
    } catch (e) {
      print(e);

      print('erro');
    }
  }
}
