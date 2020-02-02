// import 'package:flutter/material.dart';

// import 'package:intl/intl.dart';
// import 'package:plantapp/model/product.dart';
// import 'package:plantapp/model/products_repository.dart';

// class ListItemPage extends StatefulWidget {
//   @override
//   ListItemPageState createState() => new ListItemPageState();
// }

// class ListItemPageState extends State<ListItemPage> {
//   List<Container> plantItem = new List();
//   List<Product> products = ProductsRepository.loadProducts(Category.all);

//   @override
//   void initState() {
//     _buildItem();
//     super.initState();
//   }

//   _buildItem() async {
//     if (products == null || products.isEmpty) {
//       return plantItem.add(new Container());
//       // return const <Container>[];
//     }

//     return products.map((product) {
//       plantItem.add(new Container(
//           padding: new EdgeInsets.all(5.0),
//           child: new Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(10.0),
//                 ),
//               ),
//               child: new Column(
//                 children: <Widget>[
//                   new Hero(
//                     tag: product.name,
//                     child: new Material(
//                       child: new InkWell(
//                         onTap: () =>
//                             Navigator.of(context).push(new MaterialPageRoute(
//                           builder: (BuildContext context) => new DetailScreen(
//                             product: product,
//                           ),
//                         )),
//                         child: AspectRatio(
//                           aspectRatio: 18 / 11,
//                           child: Image.asset(
//                             'images/' + product.assetName,
//                             // package: product.assetPackage,
//                             fit: BoxFit.cover,
//                             // TODO: Adjust the box size (102)
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   new Padding(
//                     padding: new EdgeInsets.all(8.0),
//                   ),
//                   Text(
//                     product.name,
//                     maxLines: 1,
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(product.name),
//                 ],
//               ))));
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: new AppBar(
//         backgroundColor: Colors.lightGreen[800],
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               print(
//                   "==============================================================\n\n\n\n\n");
//               print("");
//               print(
//                   "\n\n\n\n\n==============================================================");
//             },
//           ),
//         ],
//         title: new Text(
//           "Super Hero",
//           style: new TextStyle(color: Colors.white),
//         ),
//       ),
//       body: new GridView.count(
//         primary: false,
//         padding: const EdgeInsets.all(10),
//         crossAxisCount: 2,
//         children: plantItem,
//       ),
//     );
//   }
// }

// class PageItem extends StatelessWidget {
//   final Product product;
//   const PageItem({Key key, this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AppBar appBar = new AppBar(
//       primary: false,
//       leading: IconTheme(
//           data: IconThemeData(color: Colors.white), child: CloseButton()),
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.black.withOpacity(0.4),
//               Colors.black.withOpacity(0.1),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.transparent,
//     );
//     final MediaQueryData mediaQuery = MediaQuery.of(context);

//     return Stack(children: <Widget>[
//       Hero(
//         tag: product.name,
//         child: Material(
//           child: Column(
//             children: <Widget>[
//               AspectRatio(
//                 aspectRatio: 485.0 / 384.0,
//                 child: Image.asset(
//                   'images/game/plant/greentea.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Material(
//                 child: ListTile(
//                   title: Text(product.name),
//                   subtitle: Text(product.name),
//                 ),
//               ),
//               Expanded(
//                 child: Center(child: Text("Some more content goes here!")),
//               )
//             ],
//           ),
//         ),
//       ),
//       Column(
//         children: <Widget>[
//           Container(
//             height: mediaQuery.padding.top,
//           ),
//           ConstrainedBox(
//             constraints: BoxConstraints(maxHeight: appBar.preferredSize.height),
//             child: appBar,
//           )
//         ],
//       ),
//     ]);
//   }
// }

// class DetailScreen extends StatelessWidget {
//   final Product product;
//   const DetailScreen({Key key, this.product}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         child: Center(
//           child: Hero(
//             tag: product.name,
//             child: Image.asset(
//               'images/game/plant/greentea.png',
//             ),
//           ),
//         ),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//     );
//   }
// }
