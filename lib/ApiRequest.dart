import 'dart:convert';
import 'Model.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  static final String myUrl = 'https://todoapp-api-pyq5q.ondigitalocean.app';

  static final String myKey = 'cffc27f4-7c6b-4283-8c80-7871f217f64d';

  static Future<List<Item>> getMyItems() async {
    http.Response response = await http.get(myUrl + '/todos?key=' + myKey);

    return _myResponseList(response);
  }

  //post
  static Future<List<Item>> postMyItems(Item item) async {
    http.Response response = await http.post(
      myUrl + '/todos?key=' + myKey,
      headers: <String, String>{"Content-type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        "title": item.name,
        "done": item.isDone,
      }),
    );

    return _myResponseList(response);
  }

// Put
  static Future<List<Item>> putMyItem(Item item) async {
    http.Response response = await http.put(
      myUrl + '/${item.id}/todos?key=' + myKey,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        "title": item.name,
        "done": item.isDone,
      }),
    );
    return _myResponseList(response);
  }

  static Future<List<Item>> deleteMyItems(Item item) async {
    http.Response response =
        await http.delete(myUrl + '/todos/${item.id}?key=' + myKey);
    return _myResponseList(response);
  }

  static List<Item> _myResponseList(http.Response response) {
    List<Item> todoList = [];
    var jsonResponseBody = response.body;

    var responseBody = jsonDecode(jsonResponseBody);

    responseBody
        .map((object) => todoList.add(Item(
              id: object["id"],
              name: object["title"],
              isDone: object["done"],
            )))
        .toList();

    return todoList;
  }
}
