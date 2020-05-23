import 'package:flutter/material.dart';
class cart_products extends StatefulWidget {
  @override
  _cart_productsState createState() => _cart_productsState();
}

class _cart_productsState extends State<cart_products> {
  var cart_products = [
    {
      "name": "Blazer",
      "picture": "assets/images/sasank.png",
      "price": 85,
      "size":"M",
      "color":"red",
      "quantity":1,
    },
    {
      "name": "Reddress",
      "picture": "assets/images/sasank.png",
      "price": 85,
      "size":"M",
      "color":"red",
      "quantity":1,
    },

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cart_products.length,
      itemBuilder: (context,index){
        return new single_cart(
          product_name: cart_products[index]["name"],
          product_color: cart_products[index]["color"],
          product_picture: cart_products[index]["picture"],
          product_price: cart_products[index]["price"],
          product_quantity: cart_products[index]["quantity"],
          product_size: cart_products[index]["size"] ,
        );
      }
    );
  }
}
class single_cart extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_price;
  final product_size;
  final product_color;
   var product_quantity;
  single_cart({this.product_name,this.product_picture,this.product_price,this.product_size,this.product_color,this.product_quantity});
  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(

        leading: Image.asset(product_picture,width: 100,),
        title: new Text(product_name),
        subtitle: new Column(
          children: <Widget>[
           new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(2.0),
                child: new Text("Size:"),
                ),
                Padding(padding: const EdgeInsets.all(4.0),
                  child: new Text(product_size),
                ),
                new Padding(padding: const EdgeInsets.fromLTRB(20.0,8.0,8.0,8.0),
                child: Text("color:"),),
                Padding(padding: const EdgeInsets.all(4.0),
                  child: new Text(product_color),
                ),

              ],
            ),


            new Container(
             alignment: Alignment.topLeft,
              child: new Text('\$${product_price}',
              style: TextStyle(
                fontSize: 17.0
              ),),
            ),


          ],
        ),
        trailing: new Column(
         children: <Widget>[
           InkWell(
               onTap: (){
                 addQuantity();              },
               child: new Icon(Icons.arrow_drop_up)),

            new Icon(Icons.arrow_drop_down)
          ],
       ),
      ),

    );
  }
  void addQuantity(){
    product_quantity=product_quantity+1;
    print(product_quantity);
  }
}
