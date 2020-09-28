import 'package:contact_app/screens/home/home.dart';
import 'package:contact_app/theme/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Easy Contacts",
    theme: CustomAppTheme(),
    home: Home(),
  ));
}
