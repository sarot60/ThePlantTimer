import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarSuperhero = new List();

  var karakter = [
    {"nama": "Aquaman", "gambar": "aquaman.jpg"},
    {"nama": "Batman", "gambar": "batman.jpg"},
    {"nama": "Captain Amerika", "gambar": "captain.jpg"},
    // {"nama": "Catwoman", "gambar": "catwoman.jpg"},
    // {"nama": "Flash", "gambar": "flash.jpg"},
    // {"nama": "Hulk", "gambar": "hulk.jpg"},
    // {"nama": "Ironman", "gambar": "ironman.jpg"},
    // {"nama": "Spiderman", "gambar": "spiderman.jpg"},
    // {"nama": "Venom", "gambar": "venom.jpg"},
    // {"nama": "Superman", "gambar": "superman.jpg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];

      daftarSuperhero.add(new Container(
          padding: new EdgeInsets.all(5.0),
          child: new Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: new Column(
                children: <Widget>[
                  new Hero(
                    tag: karakternya['nama'],
                    child: new Material(
                      child: new InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          // builder: (BuildContext context) => new Detail(
                          //   nama: karakternya['nama'],
                          //   gambar: gambar,
                          // ),
                          builder: (BuildContext context) =>
                              new PageItem(nama: karakternya['nama']),
                        )),
                        child: AspectRatio(
                          aspectRatio: 18 / 11,
                          child: Image.asset(
                            'images/mint01.jpg',
                            // package: product.assetPackage,
                            fit: BoxFit.cover,
                            // TODO: Adjust the box size (102)
                          ),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  Text(
                    // karakternya['nama'],
                    "สะระแหน่",
                    maxLines: 1,
                  ),
                  SizedBox(height: 8.0),
                  Text("Mint"
                      // karakternya['nama'],
                      ),
                ],
              ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Super Hero",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarSuperhero,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        primary: false,
        leading: IconTheme(
            data: IconThemeData(color: Colors.white), child: CloseButton()),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.1),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 240.0,
              child: new Hero(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "images/mint01.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  final int num;
  final String nama;
  const PageItem({Key key, this.num, this.nama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar = new AppBar(
      primary: false,
      leading: IconTheme(
          data: IconThemeData(color: Colors.white), child: CloseButton()),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Stack(children: <Widget>[
      Hero(
        // tag: "card$num",
        tag: nama,
        child: Material(
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 485.0 / 384.0,
                child: Image.asset(
                  'images/mint01.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Material(
                child: ListTile(
                  title: Text("Item $num"),
                  subtitle: Text("This is item #$num"),
                ),
              ),
              Expanded(
                child: Center(child: Text("Some more content goes here!")),
              )
            ],
          ),
        ),
      ),
      Column(
        children: <Widget>[
          Container(
            height: mediaQuery.padding.top,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: appBar.preferredSize.height),
            child: appBar,
          )
        ],
      ),
    ]);
  }
}
