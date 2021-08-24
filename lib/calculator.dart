import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = "Widget Example";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetExampleState();
  }
}

class _WidgetExampleState extends State<WidgetApp> {
  List<String> _buttonList = ['Add', 'Subtract', 'Multiply', 'Divide'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = [];
  String? _buttonText = '';
  String sum = '';

  // For each inputted two values are passed to each controller
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Widget Example"),
        ),
        body: Container(
            child: Center(
                child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Result : $sum",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: value1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: value2,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: RaisedButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Text("$_buttonText"),
                    ],
                  ),
                  color: Colors.amber,
                  onPressed: () {
                    setState(() {
                      double result = 0.0;
                      switch (_buttonText) {
                        case "Add":
                          result = double.parse(value1.value.text) +
                              double.parse(value2.value.text);
                          sum = '$result'; // convert to string again
                          break;
                        case "Subtract":
                          result = double.parse(value1.value.text) -
                              double.parse(value2.value.text);
                          sum = '$result';
                          break;
                        case "Multiply":
                          result = double.parse(value1.value.text) *
                              double.parse(value2.value.text);
                          sum = '$result';
                          break;
                        case "Divide":
                          result = double.parse(value1.value.text) /
                              double.parse(value2.value.text);
                          sum = '$result';
                          break;
                      }
                    });
                  },
                )),
            Padding(
              padding: EdgeInsets.all(15),
              child: DropdownButton(
                  items: _dropDownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _buttonText = value.toString();
                    });
                  },
                  value: _buttonText),
            ),
          ],
        ))));
  }
}
