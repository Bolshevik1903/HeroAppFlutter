import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  final int _version = 1;
  final String _databaseName = 'supehero.db';
  final String _heroTableName = 'heros';

  Database? _db;

  Future<Database> openDb() async {
    _db ??= await openDatabase(join( await getDatabasesPath(), _databaseName), onCreate: (db, version) {
      db.execute('create table $_heroTableName (id text primary key, name text, full_name text, poster_url text)');
    }, version: _version);
    return _db as Database;
  } 
}