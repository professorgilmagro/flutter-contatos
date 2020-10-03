import 'dart:io';

import 'package:contact_app/models/contact.dart';
import 'package:contact_app/theme/style.dart';
import 'package:flutter/material.dart';

Widget ItemCard(
    {Contact contact,
    EdgeInsetsGeometry padding,
    Function onCardTap,
    Function onAvatarTap,
    Function onAvatarLongPress}) {
  return GestureDetector(
    onTap: onCardTap,
    child: Card(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            TitleRow(
                name: contact.name,
                image: contact.image,
                onAvatarLongPress: onAvatarLongPress,
                onAvatarTap: onAvatarTap),
            Divider(),
            EmailRow(contact.email),
            PhoneRow(contact.phone),
          ],
        ),
      ),
    ),
  );
}

Row TitleRow(
    {String name,
    String image,
    Function onAvatarLongPress,
    Function onAvatarTap}) {
  return Row(
    children: [
      Avatar(
          imageFile: image,
          onAvatarLongPress: onAvatarLongPress,
          onAvatarTap: onAvatarTap),
      SimpleText(
        name,
        padding: EdgeInsets.only(left: 10),
        color: Colors.red[900],
        size: 25.0,
      ),
    ],
  );
}

Widget Avatar(
    {String imageFile,
    double size,
    Function onAvatarLongPress,
    Function onAvatarTap,
    bool invertColor}) {
  dynamic image = AssetImage('assets/images/photo_default.png');

  if (imageFile != null && imageFile.isNotEmpty) {
    image = FileImage(File(imageFile));
  }

  return GestureDetector(
    onTap: onAvatarTap,
    onLongPress: onAvatarLongPress,
    child: Container(
      height: size ?? 80,
      width: size ?? 80,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              blurRadius: 10.0,
              spreadRadius: 4.0,
              offset: Offset(1.0, 1.0))
        ],
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
