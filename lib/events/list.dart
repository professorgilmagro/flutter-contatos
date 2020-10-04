import 'package:contact_app/components/app_bar.dart';
import 'package:contact_app/components/snack.dart';
import 'package:contact_app/models/contact.dart';
import 'package:contact_app/repositories/contact.dart';
import 'package:contact_app/screens/contact/edit/edit.dart';
import 'package:contact_app/screens/contact/list/options.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ListEvents {
  State state;
  Contact contact;
  List<Contact> items = List();
  ImagePicker _picker = ImagePicker();
  Map<String, dynamic> _last_removed = Map();
  BuildContext context;

  ListEvents({@required this.state, @required this.contact}) {
    context = context;
  }

  loadContactFomStorage() {
    ContactRepository.make().fetchAll().then((all) {
      state.setState(() {
        this.items = all;
      });
    });
  }

  orderListBy(OrderByOptions order) {
    state.setState(() {
      order == OrderByOptions.ZA ? _orderListByDesc() : _orderListByAsc();
    });
  }

  _orderListByAsc() {
    items.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
  }

  _orderListByDesc() {
    items.sort((a, b) {
      return b.name.toLowerCase().compareTo(a.name.toLowerCase());
    });
  }

  changeAvatar(Contact item) {
    _picker.getImage(source: ImageSource.gallery).then((file) {
      if (file.path != null) {
        item.image = file.path;
        ContactRepository(item).save().then((value) {
          loadContactFomStorage();
        });
      }
    });
  }

  showOptions({Contact contact, int index}) {
    ShowContactOptions(
      context: context,
      onEditTap: () => goToEditScreen(contact, popCurrent: true),
      onDeleteTap: () => deleteContact(contact, index),
      onCallTap: () => callToContact(contact),
    );
  }

  callToContact(Contact item) {
    launch('tel:${item.phone}');
    Navigator.pop(context);
  }

  deleteContact(Contact item, int index) {
    Navigator.pop(context);
    ContactRepository(item).delete().then((value) {
      state.setState(() {
        items.removeAt(index);
        _last_removed['index'] = index;
        _last_removed['contact'] = item;
        showSnackToRestore(item);
      });
    });
  }

  showSnackToRestore(Contact item) {
    SnackMessage(context: context, description: item.name).showUndoMessage(
      onUndoPressed: restoreDeletedContact,
      textPrefix: 'Contato',
    );
  }

  void restoreDeletedContact() {
    Contact removedContact = _last_removed['contact'];
    removedContact.id = null;

    ContactRepository(removedContact).insert().then((newContact) {
      state.setState(() {
        items.insert(_last_removed['index'], removedContact);
      });
    });
  }

  goToEditScreen(Contact item, {bool popCurrent}) async {
    if (popCurrent != null && popCurrent) {
      Navigator.pop(context);
    }

    final recContact = await Navigator.push(
      state.context,
      MaterialPageRoute(
        builder: (context) => EditContact(item),
      ),
    );

    if (recContact != null) {
      this.loadContactFomStorage();
    }
  }
}
