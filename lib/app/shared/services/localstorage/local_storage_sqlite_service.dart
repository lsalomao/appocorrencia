import 'dart:io';

import 'package:app_ocorrencia/app/models/ocorrencia_model.dart';
import 'package:app_ocorrencia/app/shared/Interfaces/local_storage_sqlite_interface.dart';
import 'package:app_ocorrencia/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalStorageSqliteService implements ILocalStorageSqliteService {
  static final _databaseName = "OcorrenciaDB.db";
  static final _databaseVersion = 1;
  final AuthController authController = Modular.get<AuthController>();

  // tem somente uma referência ao banco de dados
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database;
  }

  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    db.execute(
      'drop table $tableOcorrencia',
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
                create table $tableOcorrencia ( 
                  $columnId integer primary key autoincrement, 
                  $columnRodovia text null,
                  $columnKm text null,
                  $columnSentido text null,
                  $columnDescricao text null,
                  $columnTipo text null,
                  $columnUserId int null,
                  $columnSincronismo int null,                  
                  $columnDhSincronizacao text null,
                  $columndhTimestamp text null)
                ''');
  }

  Future insert(OcorrenciaModel model) async {
    Database db = await database;
    var dhTimestamp = DateTime.now().toString();
    int sincronizado = 0;

    String sql = '''insert into $tableOcorrencia
      ($columnRodovia, $columnKm, $columnSentido, $columnDescricao, $columnTipo, 
       $columnUserId, $columnSincronismo, $columndhTimestamp)
                        values (?,?,?,?,?,?,?,?) ''';

    var _args = [
      "${model.rodovia}",
      "${model.km}",
      "${model.sentido}",
      "${model.descricao}",
      "${model.tipo}",
      "${authController.userModel.id}",
      "$sincronizado",
      "$dhTimestamp",
    ];
    model.id = await db.rawInsert(sql, _args);
  }

  Future update(OcorrenciaModel model) async {
    Database db = await database;

    String sql = '''update $tableOcorrencia set
      $columnRodovia=?, $columnKm=?, $columnSentido=?, $columnDescricao=?, $columnTipo=?  where $columnId=?''';

    var _args = [
      "${model.rodovia}",
      "${model.km}",
      "${model.sentido}",
      "${model.descricao}",
      "${model.tipo}",
      "${model.id}",
    ];
    await db.rawUpdate(sql, _args);
  }

  Future updateSincronizado(OcorrenciaModel model) async {
    Database db = await database;
    int sincronizado = 1;

    String sql = '''update $tableOcorrencia set $columnSincronismo=? where $columnId=?''';
    var _args = ["$sincronizado", "${model.id}"];
    await db.rawUpdate(sql, _args);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query(tableOcorrencia);
  }

  Future<List<Map<String, dynamic>>> queryOcorrenciaNaoSincronizadas() async {
    Database db = await database;
    //var sql = '''select * from $tableOcorrencia where $columnSincronismo = 0''';

    return await db.query(
      tableOcorrencia,
      where: "$columnSincronismo = ?",
      whereArgs: [0],
    );
  }

  @override
  Future remove(OcorrenciaModel model) async {
    Database db = await database;

    String sql = '''delete from $tableOcorrencia where $columnId=?''';

    var _args = ["${model.id}"];

    await db.rawDelete(sql, _args);
  }
}

final String tableOcorrencia = 'ocorrencia';
final String columnId = '_id';
final String columnRodovia = 'rodovia';
final String columnKm = 'km';
final String columnSentido = 'sentido';
final String columnDescricao = 'descricao';
final String columnTipo = 'tipo';
final String columnUserId = 'userid';
final String columndhTimestamp = 'dhtimestamp';
final String columnSincronismo = 'sincronizado';
final String columnDhSincronizacao = 'dhSincronizacao';
