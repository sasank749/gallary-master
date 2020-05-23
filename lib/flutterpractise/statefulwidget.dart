import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lists',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stful widget'),
          centerTitle: true,


        ),
        body: MyStateFulWidget(),


      ),


    );
  }}
  class MyStateFulWidget extends StatefulWidget {
    @override
    _MyStateFulWidgetState createState() => _MyStateFulWidgetState();
  }
  
  class _MyStateFulWidgetState extends State<MyStateFulWidget> {
    bool liked = false;
    int count = 0;
    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: (){
          setState(() {
            liked = !liked;
            count++;
          });
        },
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 220,),
              Text("I am stateful widget.\n     I  have fellings",style: TextStyle(fontSize: 30),),
              Icon(Icons.favorite,color: liked ? Colors.red : Colors.grey,size: 40,),
              Text("$count likes",style: TextStyle(fontSize: 22),)
            ],
          ),
        ),

      );

    }
  }

// stl

class MyStateLessWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("   I am stateless widget.\nSorry.I don't have fellings.",style: TextStyle(fontSize: 30),),
          Icon(Icons.favorite,color: Colors.grey,size: 40,),
          Text("0 Likes",style: TextStyle(fontSize: 22),)
        ],
      ),
    );
  }
}

class StateLessAndFul extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            MyStateLessWidget(),
            SizedBox(height: 50,),
            MyStateFulWidget()
          ],
        ),
      ),
    );
  }

}
  