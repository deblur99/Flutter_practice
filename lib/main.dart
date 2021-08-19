import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material Flutter App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialFlutterApp(),
    );
  }
}

class MaterialFlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialFlutterApp();
  }
}

class _MaterialFlutterApp extends State<MaterialFlutterApp> {
  int number = 0;
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Design App\nCount : $number"),
      ),
      body: Container(
        child: Row(
          children: [
            FloatingActionButton(
                child: Icon(
                  Icons.adjust_rounded,
                ),
                onPressed: () {
                  setState(() {
                    _number = number = 0;
                  });
                }),
            FloatingActionButton(
              child: Icon(
                Icons.add,
              ),
              onPressed: () {
                _number++;
                print(_number);
                setState(() {
                  number = _number;
                });
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.all(25.0),
      ),
    );
  }
}
