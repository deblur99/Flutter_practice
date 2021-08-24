import 'package:flutter/material.dart';
import 'imageWidget.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material Flutter App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageWidgetApp(),
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
  int number = 0, _number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Flutter App\n$_number"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          number++;
          setState(() => _number = number);
        },
      ),
      body: Container(
        child: Column(
          children: <Widget> [
            Icon(Icons.call),
            Text("Phone Book"),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      )
    );
  }
}