import 'package:flutter/material.dart';
import 'package:flutter_view/ecommerce/components/cart_products.dart';
class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.redAccent,
        title: Text('Cart'),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search,color: Colors.white,),onPressed: (){print('search');}) ,

        ],
      ),
      body: new cart_products(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text('Total'),
              subtitle: new Text('\$34'),
            ),
            ),
            Expanded(
              child: new MaterialButton(onPressed: (){},
                child:new Text("check out",style: TextStyle(color: Colors.white),),
              color: Colors.redAccent,),
            )

          ],
        ),
      ),
    );
  }
}
