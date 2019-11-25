import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'HW2';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
          primaryColor: Colors.blue, accentColor: Colors.lightBlue),
      home: HW2(title: appTitle,),
    );
  }
}

class HW2 extends StatefulWidget {
  HW2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  createState() => HW2State();
}

class HW2State extends State<HW2> {
  final List<WordPair> _suggestions = [];
  final _saved = Set<WordPair>();
  final _customFont = const TextStyle(fontSize: 18.0);
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('HW 2'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            simpleContainer,
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: _buildSuggestions(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        splashColor: Colors.redAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: _addNewRow,
        tooltip: 'Add row',
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  get simpleContainer => Center(
    child: Container(
      padding: EdgeInsets.only(bottom: 100),
      color: Colors.grey[200],
      child: FlutterLogo(
        size: 300.0,
      ),
    ),
  );

  void _addNewRow() {
    setState(() {
      _suggestions.addAll(generateWordPairs().take(2));
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _customFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _suggestions.length,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          return _buildRow(_suggestions[i]);
        });
  }
}