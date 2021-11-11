import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text('Att göra'),
        )),
        actions: [
          _dropdownMenu(),
        ],
      ),
      body: ListView(children: [
        _checkbox('Flutter'),
        _checkbox('Warzone'),
        _checkbox('Äta'),
        _checkbox('Fifa')
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pink[300],
        onPressed: () {
          print('Go get that doba');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
      ),
    );
  }
}

Widget _dropdownMenu() {
  List<String> alt = ['Markera alla', 'Avmarkera alla'];

  return PopupMenuButton<String>(
      icon: Icon(Icons.filter_list),
      onSelected: altAction,
      itemBuilder: (BuildContext context) {
        return alt.map((String alt) {
          return PopupMenuItem(
            value: alt,
            child: Text(alt),
          );
        }).toList();
      });
}

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink[300],
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text('Lägg till fler saker att göra'),
          )),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            _textField(),
            Padding(
              padding: EdgeInsets.only(left: 105.0, top: 30),
              child: Row(children: [
                _plusIcon(),
                _textBox(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _textBox() {
  return Text('Add');
}

Widget _plusIcon() {
  return IconButton(
    icon: Icon(Icons.add),
    color: Colors.pink[300],
    onPressed: () {},
  );
}

Widget _textField() {
  return TextField(
      decoration: InputDecoration(
          hintText: 'Skriv här', border: const OutlineInputBorder()));
}

Widget _checkbox(String toDo) {
  return CheckboxListTile(
      title: Text(toDo),
      value: false,
      onChanged: (value) {
        print('go get that doba');
      });
}

void altAction(String alt) {
  if (alt == 'Markera alla') {
    print('Du valde Markera alla');
  } else if (alt == 'Avmarkera alla') {
    print('Du valde Avmarkera alla');
  }
}
