class CreateContactTable {
  static final String tableName = 'contacts';
  Map<String, String> _columns = Map();

  CreateContactTable() {
    _columns['id'] = 'INTEGER PRIMARY KEY';
    _columns['name'] = 'TEXT';
    _columns['email'] = 'TEXT';
    _columns['phone'] = 'TEXT';
    _columns['image'] = 'TEXT';
  }

  Map get columns {
    return _columns;
  }

  static String getDDL() {
    List<String> fields = List();
    print(CreateContactTable().columns);
    String ddl = 'CREATE TABLE $tableName(';
    CreateContactTable().columns.forEach((column, type) {
      fields.add("$column $type");
    });

    ddl += "${fields.join(',')})";
    return ddl;
  }
}
