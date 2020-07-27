import 'dart:async';

import 'package:app_ocorrencia/app/shared/Interfaces/local_storage_interface.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageHive implements ILocalStorage {
  Completer<Box> _instance = Completer<Box>();

  init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    var box = Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStorageHive() {
    init();
  }
  @override
  Future<List<String>> get(String key) async {
    var box = await Hive.openBox('db');
  }

  @override
  Future put(String key, List<String> value) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future delete(String key) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
