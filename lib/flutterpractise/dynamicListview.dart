
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
  List<String> generatedLists(){
   List<String> list=List.generate(11, (counter)=>"Item $counter");

    return list;
  }
  Widget createLists(){
    var listitems=generatedLists();
    var listview=ListView.builder(itemBuilder: (context,index){

      return ListTile(
        leading: Text('$index'),
        title: Text(listitems[index]),
        onTap: (){
          print(listitems[index]);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Second(listitems[index])));
        },
      );
    });
    return listview;
  }
}
class Second extends StatelessWidget {
  String title;
  Second(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text(title),
        ),
      ),
    );

  }
}
