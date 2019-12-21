import 'package:flutter/material.dart';

// import all my MyHomePage widget, each represent one page.
import 'counter.dart' as _counter;
import 'list.dart' as _list;
import 'navigator.dart' as _navigator;


var homepage_list = [
  _counter.MyHomePage(title: "counter demo"),
  _list.MyHomePage(title: "list demo"),
  _navigator.MyHomePage(title: "navigator demo"),
];


class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter_app",
      // DefaultTabController + TabBar + TabBarView
      home: DefaultTabController(
        length: homepage_list.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(  
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Flutter Widgets Demo'),
          ),
          body: TabBarView(
            children: homepage_list,
          ),
        ),
      ),
    );
  }
}


void main() => runApp(new MainApp());



