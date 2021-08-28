import 'package:flutter/material.dart';
import 'package:listview_example/animalItem.dart';

class SecondApp extends StatelessWidget {
  final List<Animal> list;

  SecondApp({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: ListView.builder(
      // context: BuildContext, position: an index of widget
      itemBuilder: (context, position) {
        return GestureDetector(
          child: Card(
              child: Row(
            children: <Widget>[
              Image.asset(
                list[position].imagePath,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
              Text(list[position].animalName),
            ],
          )),
          onTap: () {
            AlertDialog dialog = AlertDialog(
              content: Text(
                'This animal is ${list[position].kind}.',
                style: TextStyle(fontSize: 30.0),
              ),
            );
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return dialog;
              },
            );
          },
        );
      },
      itemCount: list.length,
    ))));
  }
}
