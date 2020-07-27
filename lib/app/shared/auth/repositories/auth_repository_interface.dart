import 'package:app_ocorrencia/app/models/user_model.dart';

abstract class IAuthRepository {
  Future getFacebookLogin();
  Future<UserModel> getEmailPasswordLogin(UserModel userModel);
  Future<String> getToken();
  Future getlogOut();
}
