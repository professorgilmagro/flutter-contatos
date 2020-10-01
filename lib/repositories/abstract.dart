import 'package:contact_app/database/connection.dart';
import 'package:contact_app/models/base.dart';
import 'package:sqflite/sqflite.dart';

class AbstractRepository {
  Model model;

  AbstractRepository(this.model);

  Future<Database> get db async {
    return await DbConnection().db;
  }

  Future<Model> save() async {
    if (model.exists) {
      await update();
      return model;
    }

    int id = await insert();
    this.model.id = id;
    return model;
  }

  Future<int> insert() async {
    var conn = await db;
    return await conn.insert(model.tableName, model.toMap());
  }

  Future<int> update() async {
    return await (await db).update(model.tableName, model.toMap(),
        where: "id = ?", whereArgs: [this.model.id]);
  }

  Future<int> delete() async {
    return await (await db).delete(
      model.tableName,
      where: "id = ?",
      whereArgs: [this.model.id],
    );
  }

  Future<List<Map>> findById(int id) async {
    return await query(
      where: "id = ?",
      args: [id],
    );
  }

  Future<List<Map>> all() async {
    return await (await db).rawQuery("SELECT * FROM ${model.tableName}");
  }

  Future<int> count() async {
    List<Map<String, dynamic>> result = await (await db).rawQuery("SELECT COUNT(*) as total FROM ${model.tableName}");
    if(result == null || result.isEmpty) {
      return 0;
    }
    return result.first['total'];
  }

  Future<List> query({List columns, String where, List args}) async {
    return await (await db).query(
      model.tableName,
      columns: columns,
      where: where,
      whereArgs: args,
    );
  }
}
