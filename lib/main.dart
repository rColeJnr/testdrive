import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(App0309());

class App0309 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Not My First Image"),
      ),
      body: Center(
        child: Image.asset('mascotkt.png'),
      ),
    ));
  }
}

/*
* A column constructor call has a children parameter, and the
* children parameter's value is a list. In the Dart programming language
* a list is a bunch of objects.
* */

class App0306 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("adding widgets"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello world!",
                    textScaleFactor: 2.0,
                  ),
                  Text("It's lonely for me inside this phone")
                ],
              ),
            )));
  }
}

class App0305 extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: Center(
        child: Text("Hello World!"),
      ),
    ));
  }
}

class App0302 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // scaffold is a structure that provides basic, often-used functionality
      appBar: AppBar(
        title: Text("Not My First Scaffold"),
        elevation:
            4, // elevates the appBar from the surface and creates a shadow
        brightness: Brightness.dark,
      ),
      body: Center(
        child: Text("Hello world!"),
      ),
      drawer: Drawer(
        child: Center(
          child: Text("I'm a drawer"),
        ),
      ),
    ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ));
  }
}
