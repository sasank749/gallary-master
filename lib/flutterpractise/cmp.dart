import 'package:flutter/material.dart';
void main()=>runApp( MaterialApp(home: MyFirstPage(),));
class MyFirstPage extends StatelessWidget {
  final _scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(title: Text('First Screen')),
        body: Container(
          alignment: Alignment.center,
          color: Colors.green,
          height: 200,
          width: 200,
          child: Text("Boring!!!",style: TextStyle(backgroundColor: Colors.white,fontSize: 30),),
          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
          padding: EdgeInsets.all(45),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        tooltip: 'added buttons',
        onPressed: (){
          print('clicked');
          var snackbar=SnackBar(content: Text("Added to lists"),
            backgroundColor: Colors.green,
          action: SnackBarAction(label: "Undo",
          textColor: Colors.white,
          onPressed: (){
            print("Undo");
          },),);


          _scaffoldKey.currentState.showSnackBar(snackbar);

        },

        child: Icon(Icons.add),
      ),


    );
  }


}