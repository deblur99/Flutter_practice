import 'package:flutter/material.dart';
import 'package:listview_example/animalItem.dart';

class SecondApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondApp();
  }

  List<Animal> list;

  SecondApp({Key key, @required this.list}) : super(key: key);
}

class _SecondApp extends State<SecondApp> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
      child: Column(
        // put widgets into this section
        children: <Widget>[
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            maxLines: 1,
          ),
          Row(
            children: <Widget>[
              Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange),
            ],
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    )));
  }
}
