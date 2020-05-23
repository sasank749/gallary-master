import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Details.dart';
void main()=> runApp(MaterialApp(
  title: "my home page",
debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.red,
),
  home: Home(),
));
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{
  Future<List> getData() async{
    final response =await http.get("http://102:8012/getdata.php");
    return jsonDecode(response.body);
  }
  @override
  Widget build(BuildContext context) {

  return Scaffold(

  appBar: AppBar(title: Text("my app bar"),),

  floatingActionButton: FloatingActionButton(onPressed: (){
},
      child: Icon(Icons.add),),
    body: FutureBuilder<List>(
        future: getData(),
        builder: (ctx,ss){
    if(ss.hasError){
    print("erro");
    }
    if(ss.hasData){

      print("data");
    return Items(list:ss.data);
    }
    else{
      print("nodata");
    return CircularProgressIndicator();
    }
    }

    ),
  );
    }
  }

class Items extends StatelessWidget {
  List list;

  Items({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length, itemBuilder: (ctx, i) {
      return ListTile(
        leading: Icon(Icons.message),
        title: Text(list[i]['name']),
        subtitle: Text(list[i]['mobile']),
        onTap: () =>
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Details(list: list, index: i)
              ),
            ),
      );
    }
    );
  }
}