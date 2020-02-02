import 'package:flutter/material.dart';
import 'package:plantapp/game/allplant.dart';
import 'package:plantapp/test_code/all_item.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Plant Herb'),
          centerTitle: true,
          backgroundColor: Colors.lightGreen[800],
        ),
        body: Column(
          children: <Widget>[
            Image.asset(
              'images/mint01.jpg',
              fit: BoxFit.cover,
            ),
            new Expanded(
              child: buttonGridView(),
            )
          ],
        ));
  }

  GridView buttonGridView() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: InkWell(
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllPlant()),
                      )
                    }),
          ),
        ),
        Container(
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),

        // Container(
        //   padding: const EdgeInsets.all(8),
        //   child: FlatButton(
        //     onPressed: () {
        //       /*...*/
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => ListItemPage()),
        //       );
        //       // print("1");
        //     },
        //     child: Text(
        //       "Detail",
        //     ),
        //   ),
        //   color: Colors.teal[100],
        // ),
        // Container(
        //   padding: const EdgeInsets.all(8),
        //   child: FlatButton(
        //     onPressed: () {
        //       /*...*/
        //       print("1");
        //     },
        //     child: Text(
        //       "Add",
        //     ),
        //   ),
        //   color: Colors.teal[200],
        // ),
      ],
    );
  }
} //
