import 'package:flutter/material.dart';
import './FirstScreen.dart';
import './SecondScreen.dart';
import './thirdScreen.dart';

class MainUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title:Center(child: new Text("MyGate")),
            backgroundColor: Colors.red,


            actions: <Widget>[


            ],            bottom: TabBar(
              tabs: [
                Tab(text: "Activity"),
                Tab(text: "Household"),
                Tab(text: "community")

              ],
            ),
          ),
          body: TabBarView(
            children: [
              FirstScreen(),
              SecondScreen(),
              ThirdScreen(),
            ],
          ),
        ),
      ),
    );

  }


}

