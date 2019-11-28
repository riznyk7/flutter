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

Future<String> showAlertWithData(BuildContext context, data) =>
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Hey!'),
        content: Text("Do you want to return ${data.toString()}?"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(data.toString()),
            child: Text('Yes'),
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    ) ??
        null;

Future<bool> showSuccessfullAlertWithData(BuildContext context, data) =>
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Hey!'),
        content: Text("You've selected user: ${data.name}"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Yes'),
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
    ) ??
        false;