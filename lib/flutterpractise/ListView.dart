import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lists',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lists'),
          centerTitle: true,


        ),
        body: createLists(),
      ),


    );
  }
  createLists(){
    var listview=ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('this is title'),
          subtitle: Text("this is sub title"),
          trailing: Icon(Icons.attach_money),
          onTap:(){ print('mobile tab clicked');}
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text('this is email'),
          subtitle: Text("this is sub email"),
          trailing: Icon(Icons.attach_money),
            onTap:(){ print('email tab clicked');}

        )
      ],

    );
    return listview;
  }
}
