import 'package:app_ocorrencia/app/constantes/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../list_ocorrencia_controller.dart';

class ItemOcorrenciaWidget extends StatelessWidget {
  final int index;
  final controller = Modular.get<ListOcorrenciaController>();

  ItemOcorrenciaWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Tipo: ${controller.listItems[index].tipo}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Text('Rodovia: ${controller.listItems[index].rodovia}'),
              Text('Km: ${controller.listItems[index].km}'),
              Text('Sentido: ${controller.listItems[index].sentido}'),
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    color: Colors.orange,
                    onPressed: () {
                      Modular.to.pushReplacementNamed(AppRoutes.FORM_OCORRENCIA,
                          arguments: controller.listItems[index]);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.remove_circle),
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Excluir ocorrência'),
                          content: Text('Tem certeza???'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('Não'),
                            ),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text('Sim'),
                            ),
                          ],
                        ),
                      ).then(
                        (confirmed) {
                          if (confirmed) {
                            controller.removerOcorrencia(controller.listItems[index]);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    //   title: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Text(
    //       controller.listItems[index].rodovia,
    //       style: TextStyle(
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //   ),
    //   leading:
    //   subtitle: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Text('Tipo: ${controller.listItems[index].tipo}'),
    //   ),
    //   trailing:
    // );
  }
}
