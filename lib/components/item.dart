import 'dart:io';

import 'package:contact_app/models/contact.dart';
import 'package:contact_app/theme/style.dart';
import 'package:flutter/material.dart';

Widget ItemCard({Contact contact, EdgeInsetsGeometry padding, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 10,
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            TitleRow(name: contact.name, image: contact.name),
            Divider(),
            EmailRow(contact.email),
            PhoneRow(contact.phone),
          ],
        ),
      ),
    ),
  );
}

Row TitleRow({String name, String image}) {
  return Row(
    children: [
      AvatarFile(imageFile: image),
      SimpleText(
        name,
        padding: EdgeInsets.only(left: 10),
        color: Colors.red[900],
        size: 25.0,
      ),
    ],
  );
}

Widget AvatarFile({String imageFile}) {
  if (imageFile == null) {
    return CircleAvatar(
      backgroundColor: Colors.red,
      child: Icon(
        Icons.person,
        color: Colors.white,
      ),
    );
  }
  return Image.file(
    File(imageFile),
    color: Colors.red,
  );
}

Row EmailRow(String email) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(Icons.email),
      SimpleText(
        email,
        padding: EdgeInsets.only(left: 5, top: 5, bottom: 10),
        color: Colors.black87,
        size: 16.0,
      ),
    ],
  );
}

Row PhoneRow(String phone) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(Icons.phone_android),
      SimpleText(
        phone,
        padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
        color: Colors.black87,
        size: 16.0,
      ),
    ],
  );
}
