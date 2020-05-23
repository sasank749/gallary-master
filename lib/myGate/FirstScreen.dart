import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';





/// This is the stateless widget that the main application instantiates.
class FirstScreen extends StatelessWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(

        stream: Firestore.instance.collection("Activity").snapshots(),
    builder:(context,snapshot){
    if(!snapshot.hasData){
    return CircularProgressIndicator();
    }
    if(snapshot.data.documents.length==0){
    return Text("no data");
    }
    return ListView.builder(itemCount: snapshot.data.documents.length,itemBuilder:(context,index){
    return Container(
      height: 100,
      width: 100,
      child: Card(

      child: ListTile(
      leading: Image.network(snapshot.data.documents[index].data["imageURL"]),
      title:Text(snapshot.data.documents[index].data["message"]),
      subtitle:Text(snapshot.data.documents[index].data["title"]),

      ),
      ),
    );
    });
    }
    ),
    );
    }}