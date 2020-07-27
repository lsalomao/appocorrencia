import 'package:app_ocorrencia/app/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'repositories/auth_repository_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  UserModel userModel = UserModel();

  Future loginEmailSenha() async {
    userModel = await _authRepository.getEmailPasswordLogin(userModel);
  }

  // Future logOut() async {
  //   return await _authRepository.getlogOut();
  // }
}
