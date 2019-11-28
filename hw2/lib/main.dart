import 'package:flutter/material.dart';
import 'package:hw2/page/first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FirstPage(),
    );
  }
}
