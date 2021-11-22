import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model.dart';

class ViewList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: state.list.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: CheckboxListTile(
                activeColor: Colors.grey,
                value: state.getCheckbox(index),
                onChanged: (bool? newValue) {
                  state.setCheckbox(index, newValue);
                },
                title: Text(
                  state.list[index].thingsToDo,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                secondary: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    state.removeFromList(state.list[index]);
                  },
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            );
          }),
    );
  }
}
