import 'package:flutter/material.dart';

class Item {
  String thingsToDo;
  bool checkBoxIs;

  Item({required this.thingsToDo, this.checkBoxIs: false});
}

class Model extends ChangeNotifier {
  List<Item> _list = [];

  List<Item> get list => _list;

  bool getCheckbox(index) {
    return _list[index].checkBoxIs;
  }

  void addToList(Item object) {
    _list.add(object);
    notifyListeners();
  }

  void removeFromList(Item object) {
    _list.remove(object);
    notifyListeners();
  }

  void setCheckbox(index, input) {
    _list[index].checkBoxIs = input;
    notifyListeners();
  }

  List<Item> filteredList(String filter) {
    if (filter == "Avklarat") {
      return _list.where((object) => object.checkBoxIs == true).toList();
    } else if (filter == "Ej avklarat") {
      return _list.where((object) => object.checkBoxIs == false).toList();
    }

    return _list;
  }
}
