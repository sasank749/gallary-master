import 'package:flutter/material.dart';
TextEditingController editingController= TextEditingController();
void main()=>runApp(
  MaterialApp(
    title: 'hello',
    color: Colors.yellow,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green
    ),
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("data",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.red),
      ),leading: Icon(Icons.home),
        centerTitle: true,

      ),
      body:Container(
margin: EdgeInsets.all(16),
child: Column(
  children: <Widget>[
        TextField(
          controller: editingController,

    decoration: InputDecoration(

    hintText: 'enter email',

    border: OutlineInputBorder(),

      suffixIcon: Icon(Icons.email)

        ),

    ),
    RaisedButton(onPressed: (){
      print(editingController.text);

    },child: Text('login'),)

  ],
),

),
)





    ),
  );

