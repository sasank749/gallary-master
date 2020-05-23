import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lists',
      home: BottomNav(),


    );
  }}
  class BottomNav extends StatefulWidget {
    @override
    _BottomNavState createState() => _BottomNavState();
  }
  
  class _BottomNavState extends State<BottomNav> {
  int _curpos=2;
  var list=[
    Scaffold(body:Icon(Icons.home)),
    Center(child:Icon(Icons.phone)),
    Center(child:Icon(Icons.print)),
    Center(child:Icon(Icons.calendar_today)),
    Center(child:Icon(Icons.mail)),

  ];
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Bottomnavbar'),
          centerTitle: true,
        ),
        body: list[_curpos],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.blue,
          selectedItemColor: Colors.red,
          currentIndex: _curpos,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('home')),
            BottomNavigationBarItem(icon: Icon(Icons.phone),title: Text('phone')),
            BottomNavigationBarItem(icon: Icon(Icons.print),title: Text('print')),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today),title: Text('cal')),
            BottomNavigationBarItem(icon: Icon(Icons.mail),title: Text('mail')),

          ],
          onTap: (index){
            setState(() {
              _curpos=index;
            });
          },
        ),
      );
    }
  }
  