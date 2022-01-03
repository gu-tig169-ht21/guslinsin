import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model.dart';

class SecondView extends StatefulWidget {
  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  final textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Att göra lista'),
        backgroundColor: Colors.pink[300],
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _nameLabel(),
            _nameInputField(),
            Container(
              height: 24,
            ),
            Container(
              height: 24,
            ),
            _buttonRow(context),
          ],
        ),
      ),
    );
  }

  Widget _nameLabel() {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        top: 24,
      ),
      child: Text(
        'Lägg till uppgift',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _nameInputField() {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        top: 24,
      ),
      child: TextField(
          decoration: InputDecoration(
            hintText: 'Uppgift',
          ),
          controller: textEditingController),
    );
  }

  Widget _buttonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlineButton(
          onPressed: () {},
          child: Text('Avsluta'),
          highlightColor: Colors.red,
        ),
        Container(
          width: 50,
        ),
        RaisedButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false)
                .addItems(Item(name: textEditingController.text));
            Navigator.pop(context, "/");
          },
          child: Text('Lägg till'),
          color: Colors.pink[300],
          textColor: Colors.white,
          highlightColor: Colors.green,
        ),
      ],
    );
  }
}
