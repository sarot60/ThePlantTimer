import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class BlockPlant extends StatefulWidget {
  final indexBlock, persistenceData, plantDetail;

  BlockPlant({
    Key key,
    @required this.indexBlock,
    @required this.persistenceData,
    @required this.plantDetail,
  }) : super(key: key);
  @override
  _BlockPlantState createState() => _BlockPlantState();
}

class _BlockPlantState extends State<BlockPlant> {
  bool _loading;
  bool _sellload;
  double _progressValue;
  String _plantImage;
  int _colorCode;
  int sec;
  double _imgPaddingSize;

  double _progressWaterValue;

  String nameOfPlant;

  Timer timer;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _sellload = false;
    nameOfPlant = widget.persistenceData['plantName'][widget.indexBlock];
    _progressValue = widget.persistenceData['progressValue'][widget.indexBlock];

    _plantImage = widget.plantDetail[nameOfPlant]['image-asset'];
    sec = widget.plantDetail[nameOfPlant]['second_up'];

    _progressWaterValue = 0.0;
    _colorCode = 0xFFFFE082;
    _imgPaddingSize = 80;

    _updateProgress();
    _updateWaterProgress();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 10,
        child: !_sellload
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              // padding: const EdgeInsets.all(8.0),
                              padding: EdgeInsets.only(top: _imgPaddingSize),
                              // width: 100.0,
                              // height: 120.0,
                              height: 110,
                              // color: Colors.amber,
                              child: Image.asset(
                                _plantImage,
                                height: 100,
                                width: 100,
                                // fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 100,
                              color: Colors.brown,
                            ),
                          ],
                        ),
                        Container(
                          // padding: const EdgeInsets.all(8.0),
                          width: 70.0,
                          height: 100.0,
                          // color: Colors.grey,
                          child: _loading
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Growing"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 50.0,
                                        width: 50.0,
                                        child: CircularProgressIndicator(
                                            backgroundColor: Colors.grey[300],
                                            value: _progressValue,
                                            valueColor: AlwaysStoppedAnimation(
                                                Color(_colorCode)),
                                            strokeWidth: 8.0)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${(_progressValue * 100).round()}%',
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                        height: 50.0,
                                        width: 50.0,
                                        child: !_sellload
                                            ? InkWell(
                                                // When the user taps the button, show a snackbar.
                                                onTap: () {
                                                  showSellSuccess(context);
                                                  if (!mounted) return;
                                                  setState(() {
                                                    _sellload = true;
                                                    widget.persistenceData[
                                                        'playerCoin'] += widget
                                                            .plantDetail[
                                                        nameOfPlant]['sell'];
                                                    widget.persistenceData[
                                                            'progressValue'][
                                                        widget
                                                            .indexBlock] = 0.0;
                                                    widget.persistenceData[
                                                                'plantName'][
                                                            widget.indexBlock] =
                                                        'no';
                                                  });
                                                },
                                                child: Center(
                                                    child: Image.asset(
                                                  'images/game/equipment/sickle.png',
                                                )))
                                            : Center(
                                                child: Container(
                                                  padding: EdgeInsets.all(8.0),
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\$${widget.plantDetail[nameOfPlant]['sell']}',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ],
                                ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              // padding: const EdgeInsets.all(8.0),
                              // padding: const EdgeInsets.only(top: 8.0),
                              height: 60,
                              width: 50,
                              // color: Colors.blue,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _progressWaterValue <= 1.0
                                    ? <Widget>[
                                        Image.asset(
                                          'images/game/equipment/hand-wash.png',
                                          height: 30,
                                          width: 30,
                                          // fit: BoxFit.fitWidth,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            LinearProgressIndicator(
                                              value: _progressWaterValue,
                                              backgroundColor: Colors.grey[100],
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                Color(0xFF64B5F6),
                                              ),
                                            ),
                                          ],
                                        )
                                      ]
                                    : <Widget>[
                                        InkWell(
                                          onTap: () {
                                            if (!mounted) return;
                                            setState(() {
                                              _progressWaterValue = 0.0;
                                              if (_progressValue >= 0.9) {
                                                _progressValue = 1.0;
                                              } else {
                                                _progressValue += 0.05;
                                              }
                                            });
                                          },
                                          child: Image.asset(
                                            'images/game/equipment/hand-wash.png',
                                            height: 30,
                                            width: 30,
                                            // fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            LinearProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                Color(0xFF0D47A1),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                              ),
                            ),
                            Container(
                                // padding: const EdgeInsets.all(8.0),
                                // padding: const EdgeInsets.only(top: 8.0),
                                height: 60,
                                width: 50,
                                // color: Colors.blue,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        if (!mounted) return;
                                        setState(() {
                                          if (widget.persistenceData[
                                                  'playerCoin'] <
                                              500) {
                                            showNotEnoughMoney(context);
                                          } else {
                                            widget.persistenceData[
                                                'playerCoin'] -= 500.0;
                                            if (_progressValue >= 0.8) {
                                              _progressValue = 1.0;
                                            } else {
                                              _progressValue += 0.2;
                                            }
                                          }
                                        });
                                      },
                                      child: Image.asset(
                                        'images/game/equipment/fertilizer.png',
                                        height: 30,
                                        width: 30,
                                        // fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('\$500')
                                  ],
                                )),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.all(8.0),
                                width: 120.0,
                                height: 110.0,
                                // color: Colors.pink,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${widget.plantDetail[nameOfPlant]['name']}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Divider(
                                      height: 8,
                                    ),
                                    Text(
                                        'Buy ฿${widget.plantDetail[nameOfPlant]['buy']}'),
                                    Divider(
                                      height: 8,
                                    ),
                                    Text(
                                        'Growing up in ${widget.plantDetail[nameOfPlant]['fully grow']} min.'),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ])
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              // padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Please Wait !!!',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }

  void showNotEnoughMoney(BuildContext context) {
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      title: 'Your money is not enough to buy.',
      message:
          'You have money = ${widget.persistenceData['playerCoin'].toStringAsFixed(2)} Coin',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.red.shade300,
      ),
      leftBarIndicatorColor: Colors.red.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void showSellSuccess(BuildContext context) {
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      title: 'You have sold $nameOfPlant',
      message:
          'Get ${widget.plantDetail[nameOfPlant]['sell'].toStringAsFixed(2)} Coin',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.green.shade300,
      ),
      leftBarIndicatorColor: Colors.green.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void _updateProgress() {
    // const oneSec = const Duration(seconds: 1);

    timer = Timer.periodic(Duration(seconds: sec), (Timer t) {
      if (!mounted) return;
      setState(() {
        if (_progressValue < 1.0) {
          _progressValue += 0.01;
        }

        // we "finish" downloading here

        widget.persistenceData['progressValue'][widget.indexBlock] =
            _progressValue;

        // if (_progressValue.toStringAsFixed(1) == '1.0') {
        if (_progressValue >= 1.0) {
          _loading = false;
          t.cancel();
          timer.cancel();
          _progressValue = 0.0;
          return;
        }

        if (widget.persistenceData['plantName'][widget.indexBlock] == 'no') {
          t.cancel();
          timer.cancel();
          return;
        }

        if (_progressValue >= 0.99) {
          _imgPaddingSize = 20;
        } else if (_progressValue >= 0.9) {
          _colorCode = 0xFFE65100;
        } else if (_progressValue >= 0.8) {
          _colorCode = 0xFFFF6F00;
          _imgPaddingSize = 30;
        } else if (_progressValue >= 0.7) {
          _colorCode = 0xFFFF8F00;
          _imgPaddingSize = 40;
        } else if (_progressValue >= 0.6) {
          _colorCode = 0xFFFFA000;
          _imgPaddingSize = 50;
        } else if (_progressValue >= 0.4) {
          _colorCode = 0xFFFFC107;
          _imgPaddingSize = 60;
        } else if (_progressValue >= 0.2) {
          _colorCode = 0xFFFFD54F;
          _imgPaddingSize = 70;
        }
      });
    });
  }

  void _updateWaterProgress() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (!mounted) return;
      setState(() {
        _progressWaterValue += 0.05;

        if (widget.persistenceData['plantName'][widget.indexBlock] == 'no') {
          t.cancel();
          timer.cancel();
          return;
        }
      });
    });
  }

  void _showSnackbar(BuildContext context) {
    final scaff = Scaffold.of(context);
    scaff.showSnackBar(SnackBar(
      content: Container(
        child: Row(
          children: <Widget>[
            Icon(Icons.shopping_cart),
            SizedBox(
              width: 10,
            ),
            Text("Hay this is it")
          ],
        ),
      ),
      // backgroundColor: Colors.black,
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'CLOSE',
        onPressed: scaff.hideCurrentSnackBar,
      ),
    ));
  }
} //
// ==========================================================================================================
