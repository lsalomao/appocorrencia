import 'package:app_ocorrencia/app/constantes/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'list_ocorrencia_controller.dart';
import 'widgets/item_ocorrencia_widget.dart';

class ListOcorrenciaPage extends StatefulWidget {
  final String title;
  const ListOcorrenciaPage({Key key, this.title = "Ocorrências"}) : super(key: key);

  @override
  _ListOcorrenciaPageState createState() => _ListOcorrenciaPageState();
}

class _ListOcorrenciaPageState extends ModularState<ListOcorrenciaPage, ListOcorrenciaController> {
  @override
  void initState() {
    controller.loadOcorrencias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Modular.to.pushNamed(AppRoutes.HOME);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_backup_restore),
            onPressed: controller.sincronizarOcorrencias,
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.loadOcorrencias();
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Modular.to.pushNamed(AppRoutes.FORM_OCORRENCIA);
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.listItems != null) {
            if (controller.listItems.length > 0) {
              return ListView.builder(
                itemCount: controller.listItems.length,
                itemBuilder: (_, index) {
                  return ItemOcorrenciaWidget(index: index);
                },
              );
            } else {
              return Center(child: Text("Sem ocorrências"));
            }
          } else {
            return Center(
              child: RaisedButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed(AppRoutes.HOME);
                },
                child: Text('Erro...'),
              ),
            );
          }
        },
      ),
    );
  }
}
