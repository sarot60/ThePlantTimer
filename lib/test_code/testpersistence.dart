import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TestPersistence extends StatefulWidget {
  @override
  _TestPersistenceState createState() => _TestPersistenceState();
}

class _TestPersistenceState extends State<TestPersistence> {
  static Map<String, dynamic> testpersistence = {
    'playerCoin': 4900.0,
    'progressValue': [0.0, 0.0, 0.0, 0.0, 0.0],
    'plantName': ['no', 'no', 'no', 'no', 'no']
  };

  double playerCoin = testpersistence['playerCoin'];
  String progressValue = testpersistence['progressValue'].toString();
  String plantName = testpersistence['plantName'].toString();

  @override
  void initState() {
    super.initState();
    _loadData();
    // _saveData();
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    var getPlayerCoin = prefs.getDouble('playerCoin');
    var getProgressValue = prefs.getString('progressValue');
    var getPlantName = prefs.getString('plantName');
    var ab1 = json.decode(getProgressValue);
    // print(ab1);

    print(getPlantName.split('[')[1].split(']')[0].split(',').toList());
  }

  _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('playerCoin', playerCoin);
    prefs.setString('progressValue', progressValue);
    prefs.setString('plantName', plantName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              _loadData();
              // _saveData();
            },
            child: Icon(Icons.add),
          )
        ],
      )),
    );
  }
}
