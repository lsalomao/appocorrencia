import 'dart:convert';
import 'dart:math';

import 'package:app_ocorrencia/app/models/ocorrencia_model.dart';
import 'package:app_ocorrencia/app/shared/Interfaces/api_service_interface.dart';
import 'package:app_ocorrencia/app/shared/Interfaces/google_maps_interface.dart';
import 'package:app_ocorrencia/app/shared/Interfaces/local_storage_sqlite_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

import 'ocorrencia_repository_interface.dart';

class OcorrenciaRepository implements IOcorrenciaRepository {
  final ILocalStorageSqliteService storageSqliteService = Modular.get<ILocalStorageSqliteService>();
  final IGoogleMapsServices googleMapsServices = Modular.get<IGoogleMapsServices>();
  final IApiService apiService = Modular.get<IApiService>();

  @override
  Future<List<OcorrenciaModel>> queryOcorrenciaNaoSincronizadas() async {
    var _lista = await storageSqliteService.queryOcorrenciaNaoSincronizadas();

    var listaNova = <OcorrenciaModel>[];
    for (var ocorrencia in _lista) {
      var value = OcorrenciaModel(
        id: ocorrencia['_id'],
        descricao: ocorrencia['descricao'],
        km: ocorrencia['km'],
        rodovia: ocorrencia['rodovia'],
        sentido: ocorrencia['sentido'],
        tipo: ocorrencia['tipo'],
        usuarioId: ocorrencia['userid'],
        dhTimestamp: DateTime.parse(ocorrencia['dhtimestamp']),
      );

      listaNova.add(value);
    }

    return listaNova;
  }

  Future<List<OcorrenciaModel>> getAllOcorrencia() async {
    var _lista = await storageSqliteService.queryAllRows();

    var listaNova = <OcorrenciaModel>[];
    for (var ocorrencia in _lista) {
      var value = OcorrenciaModel(
        id: ocorrencia['_id'],
        descricao: ocorrencia['descricao'],
        km: ocorrencia['km'],
        rodovia: ocorrencia['rodovia'],
        sentido: ocorrencia['sentido'],
        tipo: ocorrencia['tipo'],
        usuarioId: ocorrencia['userid'],
      );

      listaNova.add(value);
    }

    return listaNova;
  }

  @override
  Future<Placemark> getLocalizacaoCompleta() async {
    return await googleMapsServices.recuperarLocalizacaoCompleta();
  }

  @override
  Future<bool> insert(OcorrenciaModel model) async {
    await storageSqliteService.insert(model);
    return true;
  }

  @override
  Future<bool> update(OcorrenciaModel model) async {
    await storageSqliteService.update(model);
    return true;
  }

  @override
  Future<bool> remove(OcorrenciaModel model) async {
    await storageSqliteService.remove(model);
    return true;
  }

  @override
  Future sincronizarOcorrencias() async {
    bool sincronizado = false;
    var ocorrencias = await queryOcorrenciaNaoSincronizadas();
    for (var ocorrenciaModel in ocorrencias) {
      sincronizado = await apiService.sincronizar(ocorrenciaModel);
      if (sincronizado) {
        await storageSqliteService.updateSincronizado(ocorrenciaModel);
      }
    }
    return sincronizado;
  }
}
