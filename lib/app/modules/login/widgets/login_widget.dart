import 'package:app_ocorrencia/app/modules/login/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../login_controller.dart';

class LoginWidget extends StatelessWidget {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(25),
      child: Observer(
        builder: (_) {
          if (!controller.loading) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      child: Image.asset(
                        "assets/images/LogoEmpresa.png",
                      ),
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextField(
                          hint: "E-mail",
                          onChanged: controller.authController.userModel.changeEmail,
                          prefix: Icon(
                            Icons.email,
                            color: Colors.blue.shade600,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextField(
                          hint: "Senha",
                          onChanged: controller.authController.userModel.changeSenha,
                          obscure: controller.obscureText,
                          prefix: Icon(
                            Icons.lock,
                            color: Colors.blue.shade500,
                          ),
                          suffix: IconButton(
                            icon: Icon(
                              Icons.visibility_off,
                              color: Colors.blue.shade500,
                            ),
                            onPressed: () {
                              bool agora = controller.obscureText;
                              controller.obscureText = !agora;
                              print(controller.obscureText);
                            },
                          ),
                        );
                      },
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: 20,
                      child: FlatButton(
                        child: Text(
                          'Recuperar Senha',
                          textAlign: TextAlign.right,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Observer(
                      builder: (_) {
                        return SizedBox(
                          height: 44,
                          child: RaisedButton(
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            color: Theme.of(context).primaryColor,
                            disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            onPressed: controller.isValid ? controller.loginEmailPassword : null,
                          ),
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return SizedBox(
                          height: 20,
                          child: Text(
                            controller.mensagemErroLogin,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              height: 50,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
