import 'package:contact_app/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Alert(
    {@required String message,
    @required String title,
    @required BuildContext context,
    String buttonOkText,
    String buttonCancelText,
    String titleIconData,
    Function onTapOK,
    Function onTapCancel}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red[800],
          title: Row(
            children: [
              Icon(
                titleIconData ?? Icons.warning,
                color: Colors.white,
                size: 40,
              ),
              SimpleText(title,
                  size: 20,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 5)),
            ],
          ),
          content: SimpleText(message, color: Colors.yellow),
          actions: [
            FlatButton(
              child: Text(
                buttonCancelText ?? "Cancelar",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: onTapCancel,
            ),
            FlatButton(
              child: Text(
                buttonOkText ?? "Ok",
                style: TextStyle(color: Colors.white70),
              ),
              onPressed: onTapOK,
            ),
          ],
        );
      });
}
