import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() async {
  Map data=await getAllData();
  print("Result is :"+data["city"]["coord"]["lat"].toString());

  runApp(new MaterialApp(
 home: new Scaffold(
   appBar: AppBar(
     title:new Text("Weather App"),
     backgroundColor: Colors.red,
     actions: <Widget>[
       new IconButton(icon: new Icon(Icons.search),
           onPressed: ()=>debugPrint("search"))
     ],
   ),
   body: new Center(
     child: new Container(
       height: 200.0,
       width:300.0,
         margin:EdgeInsets.all(10.0),
       child: new Card(
         elevation: 10.0,
         color: Colors.orange,
         child: new Column(

           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             new Text("Temp"+data["list"][0]["main"]["temp"].toString()+"C/F",
             style: TextStyle(
               fontSize: 20.0,
               color: Colors.white
             ),),
             new SizedBox(height: 5.0,),
             new Text("pressure"+data["list"][0]["main"]["pressure"].toString()+"C/F",
               style: TextStyle(
                   fontSize: 20.0,
                   color: Colors.white
               ),),

           ],
         ),
       ),

     ),
   ),
 ),
)
);}
Future<Map>getAllData() async{
  var api="https://samples.openweathermap.org/data/2.5/forecast/hourly?id=524901&appid=439d4b804bc8187953eb36d2a8c26a02";
  var data=await http.get(api);
  var jsonData=json.decode(data.body);
  return jsonData;
}