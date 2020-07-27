import 'pages/list_ocorrencia/list_ocorrencia_controller.dart';
import 'package:app_ocorrencia/app/pages/form_ocorrencia/form_ocorrencia_page.dart';

import 'pages/form_ocorrencia/form_ocorrencia_controller.dart';
import 'package:app_ocorrencia/app/constantes/routes/app_routes.dart';
import 'package:app_ocorrencia/app/pages/splash/splash_controller.dart';
import 'package:app_ocorrencia/app/pages/splash/splash_page.dart';
import 'package:dio/dio.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:app_ocorrencia/app/app_widget.dart';
import 'package:app_ocorrencia/app/modules/home/home_module.dart';

import 'modules/configuracao/configuracao_module.dart';
import 'modules/login/login_module.dart';
import 'pages/list_ocorrencia/list_ocorrencia_page.dart';
import 'shared/Interfaces/api_service_interface.dart';
import 'shared/Interfaces/google_maps_interface.dart';
import 'shared/Interfaces/local_storage_sqlite_interface.dart';
import 'shared/auth/auth_controller.dart';
import 'shared/auth/repositories/auth_repository.dart';
import 'shared/auth/repositories/auth_repository_interface.dart';
import 'shared/repositories/ocorrencia_repository.dart';
import 'shared/repositories/ocorrencia_repository_interface.dart';
import 'shared/services/api_service.dart';
import 'shared/services/google_maps_services.dart/google_maps_service.dart';
import 'shared/services/localstorage/local_storage_sqlite_service.dart';
import 'shared/utils/constantes.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ListOcorrenciaController()),
        Bind((i) => FormOcorrenciaController()),
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind((i) => AuthController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
        Bind<IApiService>((i) => ApiService()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind<ILocalStorageSqliteService>((i) => LocalStorageSqliteService()),
        Bind<IOcorrenciaRepository>((i) => OcorrenciaRepository()),
        Bind<IGoogleMapsServices>((i) => GoogleMapsServices()),
      ];

  @override
  List<Router> get routers => [
        Router(AppRoutes.SPLASH, child: (_, args) => SplashPage()),
        Router(AppRoutes.HOME, module: HomeModule()),
        Router(AppRoutes.LOGIN, module: LoginModule()),
        Router(AppRoutes.CONFIG, module: ConfiguracaoModule()),
        Router(AppRoutes.FORM_OCORRENCIA,
            child: (_, args) => FormOcorrenciaPage(ocorrenciaModel: args.data)),
        Router(AppRoutes.LIST_OCORRENCIA, child: (_, args) => ListOcorrenciaPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
