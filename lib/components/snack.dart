import 'package:flutter/material.dart';

class SnackMessage {
  BuildContext context;
  String description;
  SnackBarAction barAction;
  String textPrefix;
  String textSuffix;
  bool undoAction = false;
  int seconds;

  SnackMessage(
      {@required this.context,
      @required this.description,
      this.barAction,
      this.seconds});

  SnackBar get snack {
    return SnackBar(
        duration: Duration(seconds: seconds ?? 4),
        content: content,
        backgroundColor: Colors.black54,
        action: barAction);
  }

  Widget get content {
    if (undoAction) {
      return undoText;
    }

    return Text(description, style: TextStyle(color: Colors.white));
  }

  void showUndoMessage(
      {@required Function onUndoPressed,
      String label,
      String textPrefix,
      String textSuffix}) {
    undoAction = true;
    this.textSuffix = textSuffix;
    this.textPrefix = textPrefix;
    barAction = barAction ??
        SnackBarAction(
          label: label ?? "Desfazer",
          onPressed: onUndoPressed,
        );

    this.show();
  }

  Widget get undoText {
    return RichText(
      text: TextSpan(
        text: '${textPrefix ?? "Item"} ',
        style: TextStyle(color: Colors.white),
        children: <TextSpan>[
          TextSpan(
            text: description,
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.amber),
          ),
          TextSpan(text: ' ${textSuffix ?? "removido!"}'),
        ],
      ),
    );
  }

  void show() {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snack);
  }
}
