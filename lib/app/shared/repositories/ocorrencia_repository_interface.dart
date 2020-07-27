import 'package:app_ocorrencia/app/models/ocorrencia_model.dart';
import 'package:geolocator/geolocator.dart';

abstract class IOcorrenciaRepository {
  Future<List<OcorrenciaModel>> getAllOcorrencia();
  Future<List<OcorrenciaModel>> queryOcorrenciaNaoSincronizadas();
  Future<Placemark> getLocalizacaoCompleta();
  Future<bool> insert(OcorrenciaModel model);
  Future<bool> update(OcorrenciaModel model);
  Future<bool> remove(OcorrenciaModel model);
  Future sincronizarOcorrencias();
}
