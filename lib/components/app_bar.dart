import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum OrderByOptions { AZ, ZA }

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
      shadowColor: Colors.red,
      elevation: 1,
      leading: Image.asset(
        'assets/images/logo.png',
        height: 30,
      ),
      backgroundColor: Colors.red[900],
      actions: actions,
    );

FloatingActionButton FloatingAddButtonAction({
  Function onPressed,
  IconData iconData,
}) =>
    FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      elevation: 0.5,
    );

PopupMenuButton<OrderByOptions> PopMenuSortActions(
    {@required Function onSelectedOrder}) {
  return PopupMenuButton<OrderByOptions>(
    color: Colors.red,
    icon: Icon(Icons.more_vert, color: Colors.white),
    itemBuilder: (context) => [
      const PopupMenuItem(
        child: Text(
          'Ordernar de A → Z',
          style: TextStyle(color: Colors.white),
        ),
        value: OrderByOptions.AZ,
      ),
      const PopupMenuItem(
        child: Text(
          'Ordernar de Z → A',
          style: TextStyle(color: Colors.white),
        ),
        value: OrderByOptions.ZA,
      ),
    ],
    onSelected: onSelectedOrder,
  );
}
