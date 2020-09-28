import 'package:contact_app/db/migrations/create_contacts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConnection {
  static final DbConnection _instance = DbConnection.internal();
  Database _db;

  factory DbConnection() => _instance;

  DbConnection.internal();

  Future<Database> get db async {
    if (_db == null) {
      await _initDb();
    }

    return _db;
  }

  _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'easy_contacts.db');
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int newVersion) async {
      await db.execute(CreateContactTable.getDDL());
    });
  }
}
