import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view/myGate/mainui.dart';
import 'package:flutter_view/myGate/signup.dart';

import 'addActivty.dart';
import 'addHouseholds.dart';
import 'addcommunity.dart';
import 'loginscreen.dart';
class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),backgroundColor: Colors.redAccent),
      body: Column(
        children: <Widget>[
          Container(
            child: RaisedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((onValue){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen() ));

                });
              },
              child: const Text('Sign out', style: TextStyle(fontSize: 20)),
            ),



          ),
          Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => UploadStatus() ));

              },
              child: const Text('Add Activity', style: TextStyle(fontSize: 20)),
            ),



          ),
          Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => UploadHousehold() ));

              },
              child: const Text('Add Households', style: TextStyle(fontSize: 20)),
            ),



          ),
          Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => UploadCommunity() ));

              },
              child: const Text('Add Households', style: TextStyle(fontSize: 20)),
            ),



          ),
        ],
      ),
    );
  }
}
