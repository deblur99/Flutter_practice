import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  bool stateValue = false;
  Color buttonColor = Colors.greenAccent;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "Hello flutter",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                ),
                Switch(
                  value: stateValue,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      stateValue = value;
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("Hello button!"),
                  // swap background color of button between greenAccent and deepPurpleAccent
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor, // change the color of button by clicking the button

                  ),
                  onPressed: () {
                    print(buttonColor);
                    if (buttonColor == Colors.greenAccent) {
                      setState(() {
                        buttonColor = Colors.deepPurpleAccent;
                      });
                    } else {
                      setState(() {
                        buttonColor = Colors.greenAccent;
                      });
                    }
                  },
                  onLongPress: () => showDialog<String> (
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("AlertDialog Title"),
                      content: const Text("AlertDialog description"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, "Cancel"),
                          child: const Text("CANCEL"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, "OK"),
                          child: const Text("OK"),
                        )
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  // This widget is the root of your application.
  var switchValue = false;
  String test = "hello";
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.light(),
        home: Scaffold(
            // 배경색은 Container에서, 본문색은 Text 내 TextStyle의 color 속성에서 정의한다.
            body: Center(
              child: RaisedButton(
                child: Text("$test"),
                color: _color,
                onPressed: () {
                  if (_color == Colors.blue) {
                    setState(() {
                      test = "flutter";
                      _color = Colors.amber;
                    });
                  } else {
                    setState(() {
                      test = "hello";
                      _color = Colors.blue;
                    });
                  }
                },
              ),
            )
        )
    );
  }
}
*/