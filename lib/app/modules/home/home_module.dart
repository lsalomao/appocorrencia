import 'package:app_ocorrencia/app/constantes/routes/app_routes.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(AppRoutes.HOME, child: (_, args) => HomePage()),
      ];
}
