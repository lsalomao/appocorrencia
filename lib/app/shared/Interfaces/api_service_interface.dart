import 'package:app_ocorrencia/app/models/ocorrencia_model.dart';
import 'package:app_ocorrencia/app/models/user_model.dart';

abstract class IApiService {
  Future<UserModel> login(UserModel userModel);
  Future<bool> sincronizar(OcorrenciaModel ocorrenciaModel);
}
