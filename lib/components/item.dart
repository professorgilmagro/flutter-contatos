import 'dart:io';

import 'package:contact_app/models/contact.dart';
import 'package:contact_app/theme/style.dart';
import 'package:flutter/material.dart';

Widget ItemCard(
    {Contact contact,
    EdgeInsetsGeometry padding,
    Function onCardTap,
    Function onAvatarLongPress}) {
  return GestureDetector(
    onTap: onCardTap,
    child: Card(
      elevation: 10,
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            TitleRow(
                name: contact.name,
                image: contact.image,
                onAvatarLongPress: onAvatarLongPress),
            Divider(),
            EmailRow(contact.email),
            PhoneRow(contact.phone),
          ],
        ),
      ),
    ),
  );
}

Row TitleRow({String name, String image, Function onAvatarLongPress}) {
  return Row(
    children: [
      Avatar(imageFile: image, onAvatarLongPress: onAvatarLongPress),
      SimpleText(
        name,
        padding: EdgeInsets.only(left: 10),
        color: Colors.red[900],
        size: 25.0,
      ),
    ],
  );
}

Widget Avatar({String imageFile, Function onAvatarLongPress}) {
  dynamic image = AssetImage('assets/images/photo_default.png');
  if (imageFile != null && imageFile.isNotEmpty) {
    image = FileImage(File(imageFile));
  }

  return GestureDetector(
    onLongPress: onAvatarLongPress,
    child: Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
    ),
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
