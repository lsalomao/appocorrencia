import 'package:app_ocorrencia/app/constantes/routes/app_routes.dart';

import 'configuracao_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'configuracao_page.dart';

class ConfiguracaoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfiguracaoController()),
      ];

  @override
  List<Router> get routers => [
        Router(AppRoutes.CONFIG, child: (_, args) => ConfiguracaoPage()),
      ];
}
