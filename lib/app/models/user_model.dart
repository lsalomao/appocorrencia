import 'package:mobx/mobx.dart';
part 'user_model.g.dart';

class UserModel = _UserModelBase with _$UserModel;

abstract class _UserModelBase with Store {
  int id;

  @observable
  String email;
  @action
  changeEmail(String value) => email = value;

  @observable
  String senha;
  @action
  changeSenha(String value) => senha = value;

  String nome;
  changeNome(String value) => nome = value;

  String token;

  @observable
  String localizacao;
  @action
  changeLocalizacao(String value) => localizacao = value;

  @observable
  String longitude;
  @action
  changeLongitude(String value) => longitude = value;

  @observable
  String latitude;
  @action
  changeLatitude(String value) => latitude = value;

  @observable
  bool loggedIn = false;

  Map<String, dynamic> toJsonAutenticar() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['senha'] = this.senha;
    return data;
  }
}
