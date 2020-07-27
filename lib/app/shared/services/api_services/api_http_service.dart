import 'dart:convert';

import 'package:app_ocorrencia/app/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiHttpService {
  Future<UserModel> login(UserModel userModel) async {
    var url = 'http://10.0.2.2:32770/api/user';

    Map params = userModel.toJsonAutenticar();

    var header = {"Content-Type": "application/json"};
    var _body = json.encode(params);

    var response1 = await http.get(url);

    var response = await http.post(url, body: _body, headers: header);

    var statusCode = response.statusCode;

    var data = response.body;

    print(data);
  }
}
