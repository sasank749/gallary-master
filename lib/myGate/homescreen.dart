import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view/foodapp/api/food_api.dart';
import 'package:flutter_view/foodapp/notifier/food_notifier.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'addDetails.dart';
import 'loginscreen.dart';
import 'mainui.dart';
import 'settings.dart';
import 'signup.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyGate"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (_) =>  settings()));


          })
        ],),
      body: MyGate(),
    );
  }}
class MyGate extends StatefulWidget {
  @override
  _MyGateState createState() => _MyGateState();
}

class _MyGateState extends State<MyGate> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Form(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.person_outline,size: 100,),

                    const SizedBox(height: 30),

                    RaisedButton(

                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => AddAddressCity() ));

                      },

                      child: const Text('Add Flat/Villa', style: TextStyle(fontSize: 20,color: Colors.redAccent)),
                    ),
                    const SizedBox(height: 40),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => AddAddressCity() ));

                      },
                      child: const Text('Add WorkPlace', style: TextStyle(fontSize: 20,color: Colors.redAccent)),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'is your community using MyGate?No,'
                    ),
                    Text(
                        'request a call back,'
                    ),
                    const SizedBox(height: 40),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => MainUi() ));

                      },
                      child: const Text('Go to main Screen', style: TextStyle(fontSize: 20,color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
    );
  }}
