import 'package:flutter/material.dart';
import 'package:plantapp/model/product.dart';
import 'package:plantapp/model/products_repository.dart';

class AllPlant extends StatefulWidget {
  @override
  _AllPlantState createState() => _AllPlantState();
}

class _AllPlantState extends State<AllPlant> {
  List<Container> plantItem = new List();
  List<Product> products = ProductsRepository.loadProducts(Category.all);

  @override
  void initState() {
    _buildItem();
    super.initState();
  }

  _buildItem() async {
    if (products == null || products.isEmpty) {
      return plantItem.add(new Container());
      // return const <Container>[];
    }

    return products.map((product) {
      plantItem.add(new Container(
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
                    tag: product.name,
                    child: new Material(
                      child: new InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new DetailScreen(
                            product: product,
                          ),
                        )),
                        child: AspectRatio(
                          aspectRatio: 18 / 11,
                          child: Image.asset(
                            'images/' + product.imgSrc,
                            // package: product.assetPackage,
                            fit: BoxFit.cover,
                            // TODO: Adjust the box size (102)
                          ),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  Text(
                    product.name,
                    maxLines: 1,
                  ),
                  SizedBox(height: 8.0),
                  Text(product.nameThai),
                ],
              ))));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.amberAccent, Colors.greenAccent],
            ),
          ),
        ),
        backgroundColor: Colors.lightGreen[800],
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: () {

        //     },
        //   ),
        // ],
        centerTitle: true,
        title: new Text(
          "Plant",
          style: new TextStyle(color: Colors.black),
        ),
      ),
      body: new GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        children: plantItem,
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.amberAccent, Colors.greenAccent],
              ),
            ),
          ),
          backgroundColor: Colors.lightGreen[800],
          centerTitle: true,
          title: Text(
            'Detail',
            style: new TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: product.name,
                child: Image.asset(
                  'images/' + product.imgSrc,
                  width: 500,
                  height: 200,
                  fit: BoxFit.fitWidth,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            
            SizedBox(height: 20),
            Text(product.name),
            SizedBox(height: 20),
            Text('ชื่อภาษาไทย : ' + product.nameThai),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(product.detail),
            )
          ],
        ));
  }

}
