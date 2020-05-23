import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lists',
      home: MyTabBar(),


    );
  }}
class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {

  var list = [
    Icon(Icons.home),
    Icon(Icons.landscape),
    Icon(Icons.laptop_chromebook),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3 ,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Tab Bar"),
          ),
          centerTitle: true,

          leading: Icon(Icons.settings,),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.home),text: "Home",),
            Tab(icon: Icon(Icons.landscape),text: "Land",),
            Tab(icon: Icon(Icons.laptop_chromebook),text: "Laptop",),
          ]),
        ),
        body: TabBarView(children: list),
      ),
    );
  }
}