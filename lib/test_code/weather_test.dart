import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class WeatherTest01 extends StatefulWidget {
  @override
  _WeatherTest01State createState() => _WeatherTest01State();
}

class _WeatherTest01State extends State<WeatherTest01> {
  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }

  fetchPost() async {
    final response =
        await http.get('https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      // return response.body;
      print(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
