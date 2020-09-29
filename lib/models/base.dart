abstract class Model {
  int id;

  String get tableName;

  Model.fromMap(Map map);

  Map toMap();

  bool get exists {
    return id != null && id > 0;
  }
}
