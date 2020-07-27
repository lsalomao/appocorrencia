import 'package:app_ocorrencia/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AuthController authController = Modular.get<AuthController>();

  String getNome() {
    return authController.userModel.nome == null ? "Leandro" : "Salomão";
  }

  String getEmail() {
    return authController.userModel.email.isEmpty
        ? "leandro.salomao@gmail.com"
        : authController.userModel.email;
  }
}
