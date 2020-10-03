import 'dart:async';

import 'package:contact_app/components/alert.dart';
import 'package:contact_app/models/contact.dart';
import 'package:contact_app/repositories/contact.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditEvents {
  State state;
  Contact contact;
  String image;
  ImagePicker _picker = ImagePicker();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final contactFormKey = GlobalKey<FormState>();

  bool _wasChanged;

  EditEvents({@required this.state, @required this.contact}) {
    nameController.text = contact.name;
    phoneController.text = contact.phone;
    emailController.text = contact.email;
    _wasChanged = false;
  }

  changeAvatar() {
    _picker.getImage(source: ImageSource.gallery).then((file) {
      if (file.path != null) {
        makeAsChanged();
        state.setState(() {
          contact.image = file.path;
        });
      }
    });
  }

  makeAsChanged() {
    this._wasChanged = true;
  }

  saveContact() {
    if (contactFormKey.currentState.validate()) {
      contact.name = nameController.text;
      contact.email = emailController.text;
      contact.phone = phoneController.text;

      ContactRepository(contact).save().then((item) {
        goToList();
      });
    }
  }

  goToList() {
    Navigator.pop(state.context, contact);
  }

  Future<bool> willPop() {
    if (!_wasChanged) {
      return Future.value(true);
    }
    
    Alert(
      title: 'Descartar alterações?',
      message: 'Ao sair todas as alterações serão perdidas!',
      context: state.context,
      onTapCancel: () {
        Navigator.pop(state.context);
      },
      onTapOK: () {
        Navigator.pop(state.context);
        Navigator.pop(state.context);
      },
    );

    return Future.value(false);
  }
}
