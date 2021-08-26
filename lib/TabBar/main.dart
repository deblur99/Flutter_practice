import 'package:flutter/material.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation App",
      home: MyHomePageState(),
    );
  }
}

class MyHomePageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePageState>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.looks_one, color: Colors.blue),),
    Tab(icon: Icon(Icons.looks_two, color: Colors.blue),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBar Example"),
      ),
      body: TabBarView(
        children: <Widget>[
          FirstApp(), SecondApp(),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: TabBar(tabs: myTabs, controller: _controller,),
    );
  }

  // 'with' keyword means that you can use classes in recycling what you want
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: myTabs.length, vsync: this);
    // 'vsync: this' requires codes about screen transition
  }

  @override
  void dispose() {
    _controller
        .dispose(); // ! keyword means checking whether that variable is null or not
    super.dispose();
  }
}