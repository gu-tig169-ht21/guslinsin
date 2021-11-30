import 'package:flutter/material.dart';
import 'listview.dart';
import 'package:provider/provider.dart';
import 'Model.dart';
import 'SecondView.dart';

void main() {
  var state = MyState();
  state.postMyList();
  runApp((ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<String> _filterList = ["All", "Done", "Not Done"];

  String _filterValue = "All";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Att göra lista'),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
        actions: <Widget>[
          PopupMenuButton<String>(onSelected: (String value) {
            setState(() {
              _filterValue = value;
              print(_filterValue);
            });
          }, itemBuilder: (BuildContext context) {
            return _filterList
                .map((filter) =>
                    PopupMenuItem(value: filter, child: Text(filter)))
                .toList();
          })
        ],
      ),
      body: Consumer<MyState>(
          builder: (context, state, child) =>
              ItemList(state.filteredList(_filterValue))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pink[300],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
      ),
    );
  }
}
