import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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
                      showAlertWithData(context, result);
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

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                color: Colors.cyanAccent[100],
                child: Text("Return 42"),
                onPressed: () {
                  Navigator.of(context).pop("42");
                },
              ),
              SizedBox(height: 20,),
              CupertinoButton(
                color: Colors.cyanAccent[100],
                child: Text("Return AbErVaLlG"),
                onPressed: () {
                  Navigator.of(context).pop("AbErVaLlG");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

