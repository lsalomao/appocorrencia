import 'dart:async';
import 'dart:io';

import 'package:app_ocorrencia/app/models/ocorrencia_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'form_ocorrencia_controller.dart';

class FormOcorrenciaPage extends StatefulWidget {
  final String title;
  final OcorrenciaModel ocorrenciaModel;
  const FormOcorrenciaPage({Key key, this.title = "Ocorrência", this.ocorrenciaModel})
      : super(key: key);

  @override
  _FormOcorrenciaPageState createState() => _FormOcorrenciaPageState();
}

class _FormOcorrenciaPageState extends ModularState<FormOcorrenciaPage, FormOcorrenciaController> {
  _textField(
      {String labelText,
      onChanged,
      Function errorText,
      bool obscureText = false,
      TextEditingController textController,
      TextInputType keyboardType}) {
    return TextField(
      controller: textController,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownMenuItems;

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();

    if (widget.ocorrenciaModel == null) {
      controller.init();
      controller.tipoOcorrenciaSelecionada = _dropDownMenuItems[0].value;
    } else {
      controller.ocorrenciaModel = widget.ocorrenciaModel;
      controller.initEdit();
    }
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String ocorrencia in controller.tiposOcorrencia) {
      items.add(new DropdownMenuItem(value: ocorrencia, child: new Text(ocorrencia)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            Observer(builder: (_) {
              return IconButton(
                icon: Icon(Icons.save),
                onPressed: controller.isValid ? controller.salvarOcorrencia : null,
              );
            }),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(35),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 50,
                    child: Image.asset('assets/images/cone.png'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  child: Observer(
                    builder: (_) {
                      return DropdownButton<String>(
                        items: _dropDownMenuItems,
                        value: controller.tipoOcorrenciaSelecionada,
                        onChanged: controller.changeTipoOcorrenciaSelecionada,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Observer(
                  builder: (_) {
                    return _textField(
                      labelText: 'Rodovia',
                      onChanged: controller.ocorrenciaModel.changeRodovia,
                      textController: controller.rodoviaController,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 120,
                      child: Observer(
                        builder: (_) {
                          return _textField(
                            labelText: 'KM',
                            onChanged: controller.ocorrenciaModel.changeKm,
                            keyboardType: TextInputType.number,
                            textController: controller.kmController,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Observer(
                        builder: (_) {
                          return _textField(
                            labelText: 'Sentido',
                            onChanged: controller.ocorrenciaModel.changeSentido,
                            textController: controller.sentidoController,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5 * 32.0,
                  child: Observer(builder: (_) {
                    return TextField(
                      controller: controller.descricaoController,
                      onChanged: controller.ocorrenciaModel.changeDescricao,
                      maxLines: 5,
                      maxLength: 500,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descrição',
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Camera"),
                        onPressed: controller.changeImage,
                      ),
                      FlatButton(
                        child: Text("Galeria"),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Observer(builder: (_) {
                  if (controller.fileImagem != null) {
                    return Container(
                      child: Image.file(controller.fileImagem),
                    );
                  } else {
                    return Container();
                  }
                })
              ],
            ),
          ),
        ));
  }
}
