import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'components/horizontalComponents.dart';

import 'components/products.dart';
import 'pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //int x=2;
    //int y=3;

    Widget image_carousel= Container(
      height: 200,
         child: Carousel(
              boxFit: BoxFit.cover,
               images: [
               AssetImage('assets/images/chicken.png'),
               AssetImage('assets/images/sasank.png'),
                 AssetImage('assets/images/chicken.png'),
               AssetImage('assets/images/chicken.png'),
               AssetImage('assets/images/chicken.png')

               ],
  autoplay: false,
  animationCurve: Curves.fastOutSlowIn,
  animationDuration: Duration(milliseconds: 1000),
  dotSize: 4.0,
  dotColor: Colors.green,
  indicatorBgPadding: 6.0,
),
    );
    return Scaffold(
      appBar: AppBar(
      elevation: 0.1,
      backgroundColor: Colors.redAccent,
      title: Text('FoodApp'),
      actions: <Widget>[
        IconButton(icon:Icon(Icons.search,color: Colors.white,),onPressed: (){print('search');}) ,
        IconButton(icon:Icon(Icons.shopping_cart,color: Colors.white,),onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new cart()));
            }) ,

      ],
    ),
      drawer: Drawer(
        child:new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: Text("Sasank Reddy"), accountEmail: Text('sasank@gmail.com'),
            currentAccountPicture: GestureDetector(
              child:CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person,color: Colors.white,),
              )
            ),
              decoration: new BoxDecoration(
                color: Colors.green
              ),
            ),
            InkWell(
              onTap: (){
                print('home page');
              },
              child: ListTile(
                title: Text("home page"),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: (){
                print('My Account');
              },
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: (){
                print('My Orders');
              },
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new cart()));
              },
              child: ListTile(
                title: Text("Shopping cart"),
                leading: Icon(Icons.shopping_cart),
              ),
            ),
            InkWell(
              onTap: (){
                print('favorites');
              },
              child: ListTile(
                title: Text("Favorites"),
                leading: Icon(Icons.favorite),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){
                print('settings');
              },
              child: ListTile(
                title: Text("settings"),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: (){
                print('about');
               // print(x+y);
              },
              child: ListTile(
                title: Text("about"),
                leading: Icon(Icons.help),
              ),
            ),

          ],
        )
      ),
      body: ListView(
        children: <Widget>[
          //image carousel begins
          image_carousel,
          //padding widget
          Padding(padding: const EdgeInsets.all(8.0),
          child: new Text('Categiries'),
          ),
          //horizontal
          HorizontalList(),
          Padding(padding: const EdgeInsets.all(12.0),
            child: new Text('Recent Products'),
          ),
          //gridview
          Container(
            height: 350,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
