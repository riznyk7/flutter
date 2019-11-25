import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> exitApp(BuildContext context) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you shure you want to exit this application?'),
          content: Text('Don\'t do that'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
          ],
        );
      },
    ) ??
        false;

Future<bool> showAlertWithData(BuildContext context, data) =>
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Hey!'),
        content: Text("Data is ${data.toString()}"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('First action button'),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Second action button'),
          ),
        ],
      ),
    ) ??
        false;