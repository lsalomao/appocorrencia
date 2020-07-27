import 'package:app_ocorrencia/app/models/user_model.dart';
import 'package:app_ocorrencia/app/shared/Interfaces/api_service_interface.dart';
import 'package:app_ocorrencia/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthRepository implements IAuthRepository {
  final IApiService apiService = Modular.get<IApiService>();

  @override
  Future<UserModel> getEmailPasswordLogin(UserModel userModel) async {
    return await apiService.login(userModel);
  }

  @override
  Future getFacebookLogin() {
    throw UnimplementedError();
  }

  @override
  Future<String> getToken() {
    throw UnimplementedError();
  }

  @override
  Future getlogOut() {
    throw UnimplementedError();
  }
}
