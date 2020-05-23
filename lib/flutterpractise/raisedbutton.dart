import 'package:flutter/material.dart';
import 'package:flutter_view/flutterpractise/cmp.dart';
void main()=>runApp(
MaterialApp(
title: 'hello',
color: Colors.yellow,
debugShowCheckedModeBanner: false,
theme: ThemeData(
primarySwatch: Colors.green
),
home: MyFirstPage()
)
);

class MyFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('First Screen'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: (){print('btn1');},color: Colors.red,child: Text('btn1'),),
            RaisedButton(onPressed: (){print('btn2');},color: Colors.red,child: Text('btn2'),),
            RaisedButton(onPressed: (){print('btn3');},color: Colors.red,child: Text('btn3'),)

          ],
        )

      ),

      floatingActionButton: FloatingActionButton(
          child: Text("Click"), backgroundColor: Colors.green, onPressed: null),
    );
  }
}