import 'dart:convert';
import 'dart:io';

import 'package:app_ocorrencia/app/models/ocorrencia_model.dart';
import 'package:app_ocorrencia/app/models/user_model.dart';
import 'package:app_ocorrencia/app/shared/Interfaces/api_service_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ApiService implements IApiService {
  Future<UserModel> login(UserModel userModel) async {
    var dio = Modular.get<Dio>();
    var header = {"Content-Type": "application/json"};
    Map params = userModel.toJsonAutenticar();

    var _body = json.encode(params);
    var _option = Options(headers: header);
    try {
      var response = await dio.post("/user", data: _body, options: _option);
      var statusCode = response.statusCode;

      if (statusCode == HttpStatus.ok) {
        userModel.id = response.data["id"];
        userModel.changeNome(response.data["nome"]);
        userModel.loggedIn = true;

        return userModel;
      }

      return null;
    } on DioError catch (ex) {
      print("error:  $ex}");
      return null;
    }
  }

  @override
  Future<bool> sincronizar(OcorrenciaModel ocorrenciaModel) async {
    var dio = Modular.get<Dio>();
    var header = {"Content-Type": "application/json"};
    Map params = ocorrenciaModel.toJson();

    var _body = json.encode(params);
    var _option = Options(headers: header);
    try {
      var response = await dio.post("/ocorrencia", data: _body, options: _option);

      var statusCode = response.statusCode;

      if (statusCode == HttpStatus.ok) {
        print(response.data);
        ocorrenciaModel.sincronizado = response.data["sincronizado"];
        ocorrenciaModel.dhSincronizacao = response.data["dhSincronizacao"];

        return true;
      }
      return false;
    } on DioError catch (ex) {
      print("error:  $ex}");
      return false;
    }
  }
}
