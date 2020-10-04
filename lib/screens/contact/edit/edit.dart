import 'package:contact_app/components/app_bar.dart';
import 'package:contact_app/events/edit.dart';
import 'package:contact_app/models/contact.dart';
import 'package:contact_app/screens/contact/edit/form.dart';
import 'package:contact_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditContact extends StatefulWidget {
  Contact contact;

  EditContact(this.contact);

  @override
  _EditContactState createState() => _EditContactState(contact);
}

class _EditContactState extends State<EditContact> {
  Contact _contact;
  EditEvents _events;

  _EditContactState(this._contact);

  @override
  void initState() {
    _events = EditEvents(state: this, contact: _contact);
  }

  String _title;

  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _events.willPop,
      child: Scaffold(
        appBar: CustomAppBar(title: _title ?? "Novo contato"),
        floatingActionButton: FloatingAddButtonAction(
          iconData: Icons.save,
          onPressed: _events.saveContact,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradientDefault(),
            ),
            child: SingleChildScrollView(
              child: ContactForm(
                  context: context,
                  contact: _contact,
                  formKey: _events.contactFormKey,
                  nameController: _events.nameController,
                  emailController: _events.emailController,
                  phoneController: _events.phoneController,
                  onAvatarTap: _events.changeAvatar,
                  onChangeEmail: (text) => _events.makeAsChanged(),
                  onChangePhone: (text) => _events.makeAsChanged(),
                  onChangeName: (text) {
                    _events.makeAsChanged();
                    setState(() => {_title = text});
                  }),
            )),
      ),
    );
  }
}
