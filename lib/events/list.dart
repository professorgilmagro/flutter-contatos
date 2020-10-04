import 'package:contact_app/models/contact.dart';
import 'package:contact_app/repositories/contact.dart';
import 'package:contact_app/screens/contact/edit.dart';
import 'package:contact_app/screens/contact/options.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ListEvents {
  State state;
  Contact contact;
  List<Contact> items = List();
  ImagePicker _picker = ImagePicker();

  ListEvents({@required this.state, @required this.contact});

  loadContactFomStorage() {
    ContactRepository.make().fetchAll().then((all) {
      state.setState(() {
        this.items = all;
      });
    });
  }

  changeAvatar(Contact item) {
    _picker.getImage(source: ImageSource.gallery).then((file) {
      if (file.path != null) {
        contact.image = file.path;
        ContactRepository(contact).save().then((value) {
          loadContactFomStorage();
        });
      }
    });
  }

  showOptions(Contact item) {
    ShowContactOptions(
      context: state.context,
      onEditTap: () => goToEditScreen(item),
      onDeleteTap: () => deleteContact(item),
      onCallTap: () => callToContact(item),
    );
  }

  callToContact(Contact item) {
    launch('tel:${item.phone}');
    Navigator.pop(state.context);
  }

  deleteContact(Contact item) {
    Navigator.pop(state.context);
    ContactRepository(item).delete().then((value) {
      state.setState(() {
        items.remove(item);
      });
    });
  }

  goToEditScreen(Contact item) {
    Navigator.pop(state.context);
    Navigator.push(
      state.context,
      MaterialPageRoute(
        builder: (context) => EditContact(item),
      ),
    );
  }
}
