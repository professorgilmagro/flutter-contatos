import 'package:contact_app/components/app_bar.dart';
import 'package:contact_app/components/item.dart';
import 'package:contact_app/events/list.dart';
import 'package:contact_app/screens/contact/edit.dart';
import 'package:contact_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/contact.dart';
import '../../repositories/contact.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  ContactRepository _repository = ContactRepository.make();
  ListEvents _events;

  @override
  void initState() {
    super.initState();
    _events = ListEvents(state: this, contact: Contact());
    _events.loadContactFomStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Contatos"),
        floatingActionButton: FloatingAddButtonAction(
          iconData: Icons.add,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditContact(Contact()),
              ),
            );
          },
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradientDefault(),
          ),
          child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _events.items.length,
              itemBuilder: (context, index) {
                Contact contact = _events.items[index];
                return ItemCard(
                  contact: contact,
                  padding: EdgeInsets.all(10),
                  onAvatarLongPress: () => _events.changeAvatar(contact),
                  onCardTap: () => _events.showOptions(contact),
                );
              }),
        ));
  }
}
