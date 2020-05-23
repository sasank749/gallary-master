import 'package:flutter/material.dart';
import 'package:flutter_view/flutterpractise/SecondScreen.dart';
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('firstscreen',
      ),
    ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen("hello")));
          },
          child: Text("go to second screen"),
        ),
      )
    );
  }
}
