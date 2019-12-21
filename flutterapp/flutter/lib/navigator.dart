// -----------------------------------------------------------
//     practice how to use navigator widget
// -----------------------------------------------------------
import 'package:flutter/material.dart';


// The Stateful Widget do nothing but creating its State class:
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
          child: FirstScreen()
      );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: RaisedButton(
          child: Text('Go!'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
      )
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // navigator will jump to a totally new page...
    // you need to build everything in that new page
    return Scaffold(
      appBar: AppBar(
        title: Text("navigate to second screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back!'),
        ),
      ),
    );
  }
}

