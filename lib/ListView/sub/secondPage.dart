import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:listview_example/animalItem.dart';

class SecondApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondApp();
  }

  SecondApp({Key key}) : super(key: key);
  // @required this.list <- 2nd argument
}

class _SecondApp extends State<SecondApp> {
  final nameController = TextEditingController();
  int _radioValue = 0;
  bool flyExist = false;
  String _imagePath;
  List<Animal> displayAnimalList = [Animal(animalName: 'name', kind: 'kind', imagePath: 'path', flyExists: true)]; // for renewing the list of animals to show as widget
  List<Widget> _animalList;

  @override
  void initState() {
    super.initState();
    _animalList = <Widget>[
      Text(
        "Please add an animal by choosing it!",
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      )
    ];
  }

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
                    // A list of radio buttons to choose a sort of the animal
                    Row(
                      children: <Widget>[
                        Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange),
                        Text("Amphibia"),
                        Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange),
                        Text("Reptile"),
                        Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange),
                        Text("Mammal"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                    // A list of checkboxes to choose whether it flies or not
                    Row(
                      children: <Widget>[
                        Text("Can it fly?"),
                        Checkbox(
                            value: flyExist,
                            onChanged: (check) {
                              setState(() {
                                flyExist = check;
                              });
                            })
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                    Container(
                      height: 100,
                      // checking null and renewing the animal list on widget
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _animalList,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AlertDialog dialog = AlertDialog(
                          title: Text('Adding an animal'),
                          content: Text(
                            'This animal is ${nameController.value.text}. '
                            "Also, its kind is ${getKind(_radioValue)}.\n"
                            "It ${flyExist ? "can" : "cannot"} fly.\n"
                            "Would you like to add this one?",
                            style: TextStyle(fontSize: 30),
                          ),
                          actions: <ElevatedButton>[
                            ElevatedButton(
                              onPressed: () {
                                Animal animal = Animal(
                                    animalName: nameController.value.text,
                                    kind: getKind(_radioValue),
                                    imagePath: _imagePath,
                                    flyExists: flyExist);

                                if (!doesAnimalExistInList(animal)) {
                                  return null;
                                }

                                setState(() {
                                  if (displayAnimalList[0].imagePath == 'path') {
                                    displayAnimalList.clear();
                                  }

                                  if (doesAnimalAlreadyExist(displayAnimalList, animal)) {
                                    return null;
                                  }

                                  // change the state of list
                                  displayAnimalList.add(animal);

                                  // reflect changing element in lists and display them
                                  _animalList = convertToWidget(displayAnimalList);
                                });

                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("CANCEL"),
                            ),
                          ],
                        );
                        showDialog(
                            context: context, builder: (BuildContext context) => dialog);
                      },
                      child: Text("Adding an animal"),
                    ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    )));
  }

  _radioChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return "Amphibia";
      case 1:
        return "Reptile";
      case 2:
        return "Mammal";
    }
  }

  // checks that inputted name from user exists in the image directory (repo/images/.)
  bool doesAnimalExistInList(Animal animal) {
    List<String> animalList = ['bee', 'cat', 'cow', 'fox', 'monkey', 'pig', 'wolf', 'dog'];
    for (var item in animalList) {
      if (item == animal.animalName) {
        return true;
      }
    }
    return false;
  }

  bool doesAnimalAlreadyExist(List<Animal> animalList, Animal newAnimal) {
    for (var item in animalList) {
      if (newAnimal.animalName == item.animalName) {
        return true;
      }
    }
    return false;
  }

  List<Widget> convertToWidget(List<Animal> animalList) {
    List<Widget> result = [];

    // check whether animalList is null or not
    if (animalList != [] && animalList != null) {
      for (Animal animal in animalList) {
        GestureDetector item = GestureDetector(
            child:
                Image.asset("repo/images/${animal.animalName}.png", width: 80),
            onTap: () {
              _imagePath = "repo/images/${animal.animalName}.png";
            });

        result.add(item);
      }
    }

    return result;
  }
}
