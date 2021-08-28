import 'package:flutter/material.dart';

class Animal {
  dynamic imagePath;
  dynamic animalName;
  dynamic kind;
  dynamic flyExists = false;

  Animal(
      {@required this.animalName,
      @required this.kind,
      @required this.imagePath,
      this.flyExists});
}
