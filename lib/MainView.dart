import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ViewList.dart';
import 'Model.dart';
import 'SecondView.dart';

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Text(
            'Att göra',
          ),
        ),
        actions: [
          _dropdownMenu(),
        ],
      ),
      body: ViewList(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
          onPressed: () async {
            print('Go get that doba');
            var newToDo = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));

            if (newToDo != '') {
              Provider.of<Model>(context, listen: false).addToList(newToDo);
            }
          },
        ),
      ),
    );
  }
}

Widget _dropdownMenu() {
  List<String> choices = ['Markera Alla', 'Avmarkera Alla'];

  return Padding(
    padding: const EdgeInsets.only(right: 20.0),
    child: PopupMenuButton<String>(
      icon: Icon(
        Icons.tune_rounded,
      ),
      itemBuilder: (BuildContext context) {
        return choices.map((String choice) {
          return PopupMenuItem(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    ),
  );
}
