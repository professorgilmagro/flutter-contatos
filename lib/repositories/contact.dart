import 'package:contact_app/models/contact.dart';
import 'package:contact_app/repositories/abstract.dart';

class ContactRepository extends AbstractRepository {
  ContactRepository(Contact model) : super(model);

  Future<Contact> find(int id) async {
    List<Map> result = await this.findById(id);

    if (result.length > 0) {
      return Contact.fromMap(result.first);
    }

    return model;
  }

  Future<List<Contact>> fetchAll() async {
    List<Contact> contacts = List();
    List items = await all();

    if(items != null) {
      items.forEach((data) {
        contacts.add(Contact.fromMap(data));
      });
    }

    return contacts;
  }
}
