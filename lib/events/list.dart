import 'package:contact_app/models/contact.dart';
import 'package:contact_app/repositories/contact.dart';
import 'package:contact_app/screens/contact/edit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ListEvents {
  State state;
  Contact contact;
  ImagePicker _picker = ImagePicker();

  ListEvents({@required this.state, @required this.contact});

  changeAvatar(Contact item, {Function onChanged}) {
    _picker.getImage(source: ImageSource.gallery).then((file) {
      if (file.path != null) {
        contact.image = file.path;
        ContactRepository(contact).save().then((value) {
          onChanged();
        });
      }
    });
  }

  goToEditScreen(Contact item) {
    Navigator.push(
      state.context,
      MaterialPageRoute(
        builder: (context) => EditContact(item),
      ),
    );
  }
}
