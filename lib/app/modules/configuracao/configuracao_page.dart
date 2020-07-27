import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'configuracao_controller.dart';
import 'widgets/custom_switch_widget.dart';

class ConfiguracaoPage extends StatefulWidget {
  final String title;
  const ConfiguracaoPage({Key key, this.title = "Configuração"}) : super(key: key);

  @override
  _ConfiguracaoPageState createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends ModularState<ConfiguracaoPage, ConfiguracaoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            CustomSwitchWidget(),
          ],
        ),
      ),
    );
  }
}
