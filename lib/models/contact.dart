class Contact {
  String id;
  String name;
  String email;
  String phone;
  String image;

  @override
  String toString() {
    return toMap().toString();
  }

  Contact.fromMap(Map map) {
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
