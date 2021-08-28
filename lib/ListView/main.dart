import 'package:flutter/material.dart';
import 'animalItem.dart';
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
    Tab(
      icon: Icon(Icons.looks_one, color: Colors.blue),
    ),
    Tab(
      icon: Icon(Icons.looks_two, color: Colors.blue),
    ),
  ];

  // 'with' keyword means that you can use classes in recycling what you want
  late TabController _controller;
  List<Animal> animalList = [];

  @override
  void initState() {
    super.initState();
    // 'vsync: this' requires codes about screen transition
    _controller = TabController(length: myTabs.length, vsync: this);

    // add info about animals for creating animal instances
    animalList.add(Animal(
      animalName: 'Bee',
      kind: "insects",
      imagePath: "repo/images/bee.png",
    ));
    animalList.add(Animal(
      animalName: 'Cat',
      kind: "mammals",
      imagePath: "repo/images/cat.png",
    ));
    animalList.add(Animal(
      animalName: 'Cow',
      kind: "mammals",
      imagePath: "repo/images/cow.png",
    ));
    animalList.add(Animal(
      animalName: 'Dog',
      kind: "mammals",
      imagePath: "repo/images/dog.png",
    ));
    animalList.add(Animal(
      animalName: 'Fox',
      kind: "mammals",
      imagePath: "repo/images/fox.png",
    ));
    animalList.add(Animal(
      animalName: 'Monkey',
      kind: "apes",
      imagePath: "repo/images/monkey.png",
    ));
    animalList.add(Animal(
      animalName: 'pig',
      kind: "mammals",
      imagePath: "repo/images/pig.png",
    ));
    animalList.add(Animal(
      animalName: 'Wolf',
      kind: "mammals",
      imagePath: "repo/images/wolf.png",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBar Example"),
      ),
      body: TabBarView(
        children: <Widget>[
          FirstApp(list: animalList),
          SecondApp(list: animalList),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: myTabs,
        controller: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller
        .dispose(); // ! keyword means checking whether that variable is null or not
    super.dispose();
  }
}
