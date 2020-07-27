import 'package:app_ocorrencia/app/models/ocorrencia_model.dart';

abstract class ILocalStorageSqliteService {
  Future insert(OcorrenciaModel model);
  Future<List<Map<String, dynamic>>> queryAllRows();
  Future<List<Map<String, dynamic>>> queryOcorrenciaNaoSincronizadas();
  Future update(OcorrenciaModel model);
  Future updateSincronizado(OcorrenciaModel model);
  Future remove(OcorrenciaModel model);
}
