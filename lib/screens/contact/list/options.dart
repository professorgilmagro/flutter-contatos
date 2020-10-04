import 'package:contact_app/theme/style.dart';
import 'package:flutter/material.dart';

Widget ShowContactOptions(
    {BuildContext context,
    Function onEditTap,
    Function onCallTap,
    Function onDeleteTap}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradientDefault(),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlatButton(
                      child: SimpleText('Ligar', size: 20),
                      textColor: Colors.white,
                      onPressed: onCallTap,
                    ),
                    Divider(
                      color: Colors.black87,
                    ),
                    FlatButton(
                      child: SimpleText('Editar', size: 20),
                      textColor: Colors.white,
                      onPressed: onEditTap,
                    ),
                    Divider(
                      color: Colors.black87,
                    ),
                    FlatButton(
                      child: SimpleText('Remover', size: 20),
                      textColor: Colors.white,
                      onPressed: onDeleteTap,
                    ),
                  ],
                ),
              );
            });
      });
}
