import 'package:app_ocorrencia/app/constantes/routes/app_routes.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(AppRoutes.LOGIN, child: (_, args) => LoginPage()),
      ];
}
