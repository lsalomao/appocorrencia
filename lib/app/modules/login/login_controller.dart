import 'package:app_ocorrencia/app/constantes/routes/app_routes.dart';
import 'package:app_ocorrencia/app/shared/auth/auth_controller.dart';
import 'package:app_ocorrencia/app/shared/services/api_services/api_http_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthController authController = Modular.get<AuthController>();
  @observable
  String mensagemErroLogin = '';

  @observable
  bool loading = false;

  @observable
  bool obscureText = true;

  @computed
  bool get isValid => validateEmail() == null && validateSenha() == null;

  @action
  Future loginEmailPassword() async {
    try {
      loading = true;
      await authController.loginEmailSenha();
      if (authController.userModel != null) {
        Modular.to.pushReplacementNamed(AppRoutes.HOME);
      } else {
        mensagemErroLogin = 'Login não autorizado';
      }
    } catch (e) {
      loading = false;
    }
  }

  String validateEmail() {
    if (authController.userModel.email == null || authController.userModel.email.isEmpty) {
      return "Email é obrigatório";
    } else if (authController.userModel.email.length < 3) {
      return "Email inválido";
    } else if (!authController.userModel.email.contains("@")) {
      return "Email inválido";
    }
    return null;
  }

  String validateSenha() {
    if (authController.userModel.senha == null || authController.userModel.senha.isEmpty) {
      return "Senha é obrigatório";
    } else if (authController.userModel.senha.length < 3) {
      return "Senha inválido";
    }
    return null;
  }
}
