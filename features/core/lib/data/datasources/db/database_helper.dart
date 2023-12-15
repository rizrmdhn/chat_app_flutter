import 'dart:async';
import 'package:core/data/models/access_token_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _accessToken = 'access_token';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/chatapp.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: onCreate);
    return db;
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_accessToken (
        type TEXT,
        token TEXT,
        expires_at TEXT
      )
    ''');
  }

  Future<void> insertAccessToken(AccessTokenModel accessToken) async {
    final db = await database;

    await db!.insert(_accessToken, accessToken.toJson());
  }

  Future<AccessTokenModel?> getAccessToken() async {
    final db = await database;
    final accessToken = await db!.query(_accessToken);
    if (accessToken.isNotEmpty) {
      return AccessTokenModel.fromJson(accessToken.first);
    } else {
      return null;
    }
  }

  Future<void> deleteAccessToken() async {
    final db = await database;
    await db!.delete(_accessToken);
  }
}
