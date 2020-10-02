import 'package:contact_app/components/app_bar.dart';
import 'package:contact_app/components/item.dart';
import 'package:contact_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/contact.dart';
import '../../repositories/contact.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ContactRepository _repository = ContactRepository.make();
  List<Contact> items = List();
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _repository.fetchAll().then((all) => {
          setState(() => {items = all})
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Contatos"),
      floatingActionButton: FloatingAddButtonAction(
        onPressed: () {},
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradientDefault(),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: items.length,
          itemBuilder: (context, index) {
            Contact contact = items[index];
            return ItemCard(
                contact: contact,
                padding: EdgeInsets.all(10),
                onAvatarLongPress: () {
                  picker.getImage(source: ImageSource.gallery).then((file) {
                    contact.image = file.path;
                    ContactRepository(contact).save().then((item) => {
                          _repository.fetchAll().then((all) => {
                                setState(() => {items = all})
                              })
                        });
                  });
                },
                onCardTap: () {});
          },
        ),
      ),
    );
  }
}
