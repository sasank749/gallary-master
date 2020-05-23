import 'package:flutter/material.dart';
class SecondScreen extends StatelessWidget {
  String text;
  SecondScreen(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('secondscreen',
        ),
      ),
        body: Container(
          alignment: Alignment.center,
          child: Column(

            children: <Widget>[
              Text('message is $text'),
              RaisedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("go to first screen"),
              ),
            ],
          ),
        )
    );
  }
}
