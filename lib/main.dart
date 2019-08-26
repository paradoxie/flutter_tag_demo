import 'package:flutter/material.dart';

import 'tag.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter tag Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _info = "什么也没有";

  final Set<String> _selectedList = <String>{};
  List<String> showList = <String>[
    'Kotlin',
    'Swift',
    'Dart',
    'Go',
    'C',
  ];

  void _showSelected() {
    setState(() {
      _info = _selectedList.toList().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_info',
            ),
            Tag(
              list: showList,
              onpress: (String name) {
                return FilterChip(
                  key: ValueKey<String>(name),
                  avatar: null,
                  label: Text(name),
                  selected: _selectedList.contains(name),
                  onSelected: (bool value) {
                    setState(() {
                      if (!value) {
                        _selectedList.remove(name);
                      } else {
                        _selectedList.add(name);
                      }
                    });
                  },
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSelected,
        child: Icon(Icons.lightbulb_outline),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
