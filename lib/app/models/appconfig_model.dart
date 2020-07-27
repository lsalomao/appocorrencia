import 'package:mobx/mobx.dart';
part 'appconfig_model.g.dart';

class AppConfigModel = _AppConfigModelBase with _$AppConfigModel;

abstract class _AppConfigModelBase with Store {
  @observable
  bool isDark = false;

  @action
  changeThemeSwitch(bool value) => isDark = value;
}
