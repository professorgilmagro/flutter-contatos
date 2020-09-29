import 'package:contact_app/models/base.dart';

class Contact extends Model {
  String name;
  String email;
  String phone;
  String image;

  Contact({this.name, this.email, this.phone, this.image})
      : super.fromMap(null);

  @override
  String get tableName => 'contacts';

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  String getTableName() {
    return 'contacts';
  }

  Contact.fromMap(Map map) : super.fromMap(null) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    image = map['image'];
  }

  Map toMap() {
    Map<String, dynamic> data = Map();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    return data;
  }
}
