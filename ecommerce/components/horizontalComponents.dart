import 'package:flutter/material.dart';
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
         Categery(image_location: 'assets/images/sasank.png',image_caption: 'good boy'),
          Categery(image_location: 'assets/images/sasank.png',image_caption: 'good boy'),
          Categery(image_location: 'assets/images/sasank.png',image_caption: 'good boy'),
          Categery(image_location: 'assets/images/sasank.png',image_caption: 'good boy'),


        ],
      ),
    );
  }
}
class Categery extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Categery({this.image_location,this.image_caption});
  @override
  Widget build(BuildContext context) {
    //returning padding
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width:100.0,

          child: ListTile(
            title: Image.asset(image_location,width: 100.0,height: 80.0,),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption,style: new TextStyle(fontSize: 12.0),),)
          ),
        ),
      ),
    );
  }
}

