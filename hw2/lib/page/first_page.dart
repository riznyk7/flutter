import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hw2/common/dialog.dart';

import 'package:hw2/model/user.dart';
import 'package:hw2/page/second_page.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitApp(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home page"),
        ),
        body: Container(
          color: Colors.cyanAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CupertinoButton(
                  color: Colors.cyanAccent[100],
                  child: Text("Go next"),
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => SecondPage()),
                    );
                    if (result != null) {
                      showSuccessfullAlertWithData(context, result);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
