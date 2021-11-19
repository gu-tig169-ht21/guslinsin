import 'package:my_first_app/Model.dart';
import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Lägg till saker att göra'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: TextField(
                  controller: myController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Fyll i här...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 95.0, top: 20),
                child: Row(
                  children: [
                    _addButton(context, myController),
                    _textAdd(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _addButton(context, TextEditingController myController) {
  return IconButton(
      iconSize: 40.0,
      icon: Icon(Icons.add),
      onPressed: () {
        print('Go get that doba');
        Navigator.pop(
            context, Item(checkBoxIs: false, thingsToDo: myController.text));
      });
}

Widget _textAdd() {
  return Text(
    'Lägg till',
    style: TextStyle(
      fontSize: 20.0,
    ),
  );
}
