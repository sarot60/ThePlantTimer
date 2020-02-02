import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:plantapp/game/allplant.dart';

import 'block_plant.dart';


class GameMain extends StatefulWidget {
  @override
  _GameMainState createState() => _GameMainState();
}

class _GameMainState extends State<GameMain> {
  final List<String> myPlantName = [
    "aloevera",
    "bamboo",
    "coconut",
    "greentea",
    "maple",
    "rice"
  ];

  Map<String, dynamic> plantDetail = {
    "aloevera": {
      "name": "Aloe Vera",
      "fully grow": 1.4,
      "buy": 100,
      "sell": 170.5,
      "image-asset": "images/game/plant/aloevera.png",
      "second_up": 1,
    },
    "bamboo": {
      "name": "Bamboo",
      "fully grow": 2.8,
      "buy": 150,
      "sell": 220,
      "image-asset": "images/game/plant/bamboo.png",
      "second_up": 2,
    },
    "coconut": {
      "name": "Coconut",
      "fully grow": 2.8,
      "buy": 399,
      "sell": 550.7,
      "image-asset": "images/game/plant/coconut.png",
      "second_up": 2,
    },
    "greentea": {
      "name": "Green Tea",
      "fully grow": 1.4,
      "buy": 90,
      "sell": 130,
      "image-asset": "images/game/plant/greentea.png",
      "second_up": 1,
    },
    "maple": {
      "name": "Maple",
      "fully grow": 5,
      "buy": 1205.5,
      "sell": 1500,
      "image-asset": "images/game/plant/maple.png",
      "second_up": 3,
    },
    "rice": {
      "name": "Rice",
      "fully grow": 1.4,
      "buy": 200,
      "sell": 329,
      "image-asset": "images/game/plant/rice.png",
      "second_up": 1,
    },
  };

  static Map<String, dynamic> persistenceData;

  @override
  void initState() {
    super.initState();

    _loadData();

    Timer.periodic(Duration(seconds: 3), (Timer t) => _checkUpdate());
    Timer.periodic(Duration(seconds: 5), (Timer t) => _autoSaveGame());
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    var playerCoin = prefs.getDouble('playerCoin');

    var getProgressValue = prefs.getString('progressValue');
    var listProgressValue = json.decode(getProgressValue);

    var getPlantName = prefs.getString('plantName');
    var listPlantName = getPlantName
        .replaceAll(new RegExp(r"\s+\b|\b\s"), "")
        .split('[')[1]
        .split(']')[0]
        .split(',');

    if (playerCoin == null ||
        getProgressValue == null ||
        getPlantName == null) {
      setState(() {
        _setDefaultData();
        return;
      });
    }
    
    persistenceData = {
      'playerCoin': playerCoin,
      'progressValue': listProgressValue,
      'plantName': listPlantName
    };
  }

  _autoSaveGame() async {
    final prefs = await SharedPreferences.getInstance();
    if (persistenceData != null) {
      prefs.setDouble('playerCoin', persistenceData['playerCoin']);
      prefs.setString(
          'progressValue', persistenceData['progressValue'].toString());
      prefs.setString('plantName', persistenceData['plantName'].toString());
      print('Auto Save Success');
    }
    return;
  }

  _checkUpdate() {
    if (!mounted) return;
    setState(() {});
  }

  static Map<String, dynamic> defalutData = {
    'playerCoin': 500.0,
    'progressValue': [0.0, 0.0, 0.0, 0.0, 0.0],
    'plantName': ['no', 'no', 'no', 'no', 'no']
  };

  double plaCoin = defalutData['playerCoin'];
  String progValue = defalutData['progressValue'].toString();
  String pName = defalutData['plantName'].toString();

  _setDefaultData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('playerCoin', plaCoin);
    prefs.setString('progressValue', progValue);
    prefs.setString('plantName', pName);
    print('Set Default Game Success');
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Plant Game Options',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.amberAccent, Colors.greenAccent],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.refresh,
                color: Colors.blue,
              ),
              title: Text('Reset Game'),
              dense: false,
              onTap: () {
                if (!mounted) return;
                setState(() {
                  _setDefaultData();
                });

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.close, color: Colors.red),
              title: Text('Close'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: <Widget>[
          Builder(
            builder: (context) => Center(
              child: IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
            ),
          ),
        ],
        title: Text(
          "PLANT",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.amberAccent, Colors.greenAccent],
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[800],
        bottom: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.amberAccent, Colors.greenAccent],
              ),
            ),
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            // color: Colors.green,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text('LEVEL : 0',
                    //     style: TextStyle(fontSize: 18, color: Colors.white)),
                    Text(
                        'MONEY : ${persistenceData == null ? '___' : persistenceData['playerCoin'].toStringAsFixed(2)} COIN',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('PLANT DETAIL',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.black,
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AllPlant()),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(70.0),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          // if (this._block[index] != null) {
          if (persistenceData == null) {
            return _nullBlock(index);
          }
          if (persistenceData['plantName'][index] != 'no') {
            return BlockPlant(
              indexBlock: index,
              persistenceData: persistenceData,
              plantDetail: plantDetail,
            );
          }
          return _nullBlock(index);
        },
      ),
    );
  }

  _nullBlock(int index) {
    return Container(
      height: 128,
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          // color: Colors.pink,
          elevation: 10,
          child: Column(
            children: <Widget>[
              Container(
                width: 120,
                height: 120,
                // color: Colors.green,
                child: InkWell(
                    // When the user taps the button, show a snackbar.
                    onTap: () {
                      showShopDialog(context, index);
                      // print("Hello World");
                    },
                    child: Center(
                      child: Icon(Icons.add),
                    )),
              )
            ],
          )),
    );
  }

  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      title: 'This action is prohibited',
      message: 'Lorem ipsum dolor sit amet',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 1),
    )..show(context);
  }

  void showNotEnoughMoney(BuildContext context) {
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      title: 'Your money is not enough to buy.',
      message:
          'You have money = ${persistenceData['playerCoin'].toStringAsFixed(2)} Coin',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.red.shade300,
      ),
      leftBarIndicatorColor: Colors.red.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void _showSnackbar(BuildContext context) {
    final scaff = Scaffold.of(context);
    scaff.showSnackBar(SnackBar(
      content: Text("Hay this is it"),
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: scaff.hideCurrentSnackBar,
      ),
    ));
  }

  void showShopDialog(BuildContext context, int index) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            titlePadding: EdgeInsets.all(10.0),
            contentPadding: EdgeInsets.all(0.0),
            title: Text("Buy Plant"),
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: getPlatList(index)),
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 1.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        // shape: OutlineInputBorder(
                        //     borderRadius: BorderRadius.only(
                        //         bottomLeft: Radius.circular(4.0),
                        //         topLeft: Radius.circular(4.0))),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text("CANCLE"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]),
          );
        });
  }

  List<Widget> getPlatList(int index) {
    return myPlantName.map((x) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: InkWell(
            // When the user taps the button, show a snackbar.
            onTap: () {
              Navigator.of(context).pop();
              print(index);
              print(x);
              if (!mounted) return;
              setState(() {
                if (persistenceData['playerCoin'] < plantDetail[x]['buy']) {
                  showNotEnoughMoney(context);
                } else {
                  persistenceData['plantName'][index] = x;
                  persistenceData['playerCoin'] -= plantDetail[x]['buy'];
                  print(plantDetail[persistenceData['plantName'][index]]);
                }
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    plantDetail[x]['image-asset'],
                    height: 50,
                    width: 50,
                    // fit: BoxFit.fitWidth,
                  ),
                  Text(x,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('\$${plantDetail[x]['buy']} coin',
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
                  Icon(Icons.navigate_next),
                ])),
      );
    }).toList();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
} //

// ==========================================================================================================

