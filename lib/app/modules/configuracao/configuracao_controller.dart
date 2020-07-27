import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../app_controller.dart';

part 'configuracao_controller.g.dart';

class ConfiguracaoController = _ConfiguracaoControllerBase with _$ConfiguracaoController;

abstract class _ConfiguracaoControllerBase with Store {
  final AppController appController = Modular.get<AppController>();
}
