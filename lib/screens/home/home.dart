import 'package:contact_app/components/app_bar.dart';
import 'package:contact_app/theme/style.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Contatos"),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradientDefault(),
        ),
      ),
    );
  }
}
