import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset;

  Future _getGifs() async {
    http.Response response;
    String _urlHome =
        "https://api.giphy.com/v1/gifs/trending?api_key=ZOgIxk8PMNQD7O7LtZ0bIw9z0ZmmADrJ&limit=20&rating=G";
    String _urlSearch =
        "https://api.giphy.com/v1/gifs/search?api_key=ZOgIxk8PMNQD7O7LtZ0bIw9z0ZmmADrJ&q=$_search&limit=20&offset=$_offset&rating=G&lang=pt";

    if (_search == null) {
      response = await http.get(_urlHome);
    } else {
      response = await http.get(_urlSearch);
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
