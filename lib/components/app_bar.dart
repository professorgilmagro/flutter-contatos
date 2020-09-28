import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar CustomAppBar({@required title, List<Widget> actions}) => AppBar(
      title: Text(
        title,
        style: GoogleFonts.acme(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 26,
          letterSpacing: 1,
        ),
      ),
      toolbarHeight: 80,
      elevation: 0.1,
      leading: Image.asset(
        'assets/images/logo.png',
        height: 30,
      ),
      backgroundColor: Colors.orangeAccent,
      actions: actions,
    );
