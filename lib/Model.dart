import 'package:flutter/material.dart';
import 'ApiRequest.dart';

class Item {
  String id;
  String name;
  bool isDone;

  Item({this.id, this.name, this.isDone = false});
}

class MyState extends ChangeNotifier {
  List<Item> _list = [];

  void postMyList() async {
    this._list = await ApiRequest.getMyItems();
    notifyListeners();
  }

  void addItems(Item item) async {
    _list = (await ApiRequest.postMyItems(item)).cast<Item>();
    notifyListeners();
  }

  void putMyItems(Item item) async {
    _list = await ApiRequest.putMyItem(item);
    notifyListeners();
  }

  void removeMyItems(Item item) async {
    _list = await ApiRequest.deleteMyItems(item);
    notifyListeners();
  }

  List<Item> filteredList(String filter) {
    if (filter == "Done") {
      return _list.where((item) => item.isDone == true).toList();
    } else if (filter == "Not Done") {
      return _list.where((item) => item.isDone == false).toList();
    }

    return _list;
  }
}
