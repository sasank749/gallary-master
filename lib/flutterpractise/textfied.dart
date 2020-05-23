
import 'package:flutter/material.dart';
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

  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( title: Text('First Screen')),
        body: Container(

          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextField(
                controller: editingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.mail)
                ),
              ),


              RaisedButton(onPressed: (){
                print(''+editingController.text);
              }
                ,child: Text("Get Data"),),
              //alerts
              RaisedButton(onPressed: (){
                createAlertDialogue(context);
              },

                child: Text("alerts"),),
            ],
          ),
        )

    );

  }
  createAlertDialogue(BuildContext context){
    var alertdialogue=AlertDialog(title: Text("congrats"),content: Text("this basi alert"),
    actions: <Widget>[
      RaisedButton(onPressed: (){
        Navigator.pop(context);
      },child: Text("ok"),
      ),
      GestureDetector(
        child: Text("close"),
        onTap: (){
          Navigator.pop(context);
        },
      )

    ],
    );
showDialog(context: context,
builder: (BuildContext context){
  return alertdialogue;
});

  }
}