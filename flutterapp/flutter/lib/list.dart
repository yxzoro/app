// -----------------------------------------------------------
//     practice how to use list widget
// -----------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


// The Stateful Widget do nothing but creating its State class:
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<String> items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return new Container(
          child: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text('${items[index]}'),
            );
          },
        )
      );
  }
}



