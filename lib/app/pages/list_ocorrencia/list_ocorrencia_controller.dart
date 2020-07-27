import 'package:app_ocorrencia/app/models/ocorrencia_model.dart';
import 'package:app_ocorrencia/app/shared/repositories/ocorrencia_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'list_ocorrencia_controller.g.dart';

class ListOcorrenciaController = _ListOcorrenciaControllerBase with _$ListOcorrenciaController;

abstract class _ListOcorrenciaControllerBase with Store {
  final IOcorrenciaRepository ocorrenciaRepository = Modular.get<IOcorrenciaRepository>();

  @observable
  ObservableList<OcorrenciaModel> listItems = <OcorrenciaModel>[].asObservable();

  @computed
  int get total => listItems.length;

  @action
  loadOcorrencias() async {
    listItems = ObservableList.of(await ocorrenciaRepository.queryOcorrenciaNaoSincronizadas());
  }

  @action
  removerOcorrencia(OcorrenciaModel model) async {
    bool acaoModel = await ocorrenciaRepository.remove(model);
    if (acaoModel) {
      loadOcorrencias();
    }
  }

  @action
  sincronizarOcorrencias() async {
    await ocorrenciaRepository.sincronizarOcorrencias();
    loadOcorrencias();
  }
}
