import 'package:flutter/material.dart';
import 'package:flutter_view/ecommerce/components/products.dart';
class productdetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;
  productdetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture
});

  @override
  _productdetailsState createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.redAccent,
        title: Text('FoodApp'),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search,color: Colors.white,),onPressed: (){print('search');}) ,

        ],
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  title: new Row(children: <Widget>[
                    Expanded(
                      child: new Text("\$${widget.product_detail_new_price}",style: TextStyle(color: Colors.green),),

                    ),
                    Expanded(
                      child: new Text("\$${widget.product_detail_old_price}",style: TextStyle(color: Colors.red,decoration: TextDecoration.lineThrough),),

                    ),
                  ],),
                ),
              ),

            ),

          ),
          Row(

            children: <Widget>[

              Expanded(
                child:MaterialButton(onPressed: (){
                  showDialog(context: context,builder: (context) {
                    //alerts
                    return new AlertDialog(
                      title: new Text('size'),
                      content: new Text('choose the size'),
                      actions: <Widget>[
                        new MaterialButton(onPressed: () {
                          Navigator.of(context).pop(context);
                         },
                            child: new Text('close'))

                      ],
                    );
                  } );

                 },

                  elevation: 0.3,
                  color: Colors.white,textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: new Text("size"),),
                        Expanded(child: new Icon(Icons.arrow_drop_down),)
                      ],
                    ),)
              ),
              Expanded(
                  child:MaterialButton(onPressed: (){
                    showDialog(context: context,builder: (context) {
                      //alerts
                      return new AlertDialog(
                        title: new Text('Colors'),
                        content: new Text('choose the colors'),
                        actions: <Widget>[
                          new MaterialButton(onPressed: () {
                            Navigator.of(context).pop(context);
                          },
                              child: new Text('close'))

                        ],
                      );
                    } );

                  },
                    elevation: 0.3,
                    color: Colors.white,textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: new Text("Colors"),),
                        Expanded(child: new Icon(Icons.arrow_drop_down),)
                      ],
                    ),)
              ),
              Expanded(
                  child:MaterialButton(onPressed: (){
                    showDialog(context: context,builder: (context) {
                      //alerts
                      return new AlertDialog(
                        title: new Text('qty'),
                        content: new Text('choose the qty'),
                        actions: <Widget>[
                          new MaterialButton(onPressed: () {
                            Navigator.of(context).pop(context);
                          },
                              child: new Text('close'))

                        ],
                      );
                    } );

                  },
                    elevation: 0.3,
                    color: Colors.white,textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: new Text("Qty"),),
                        Expanded(child: new Icon(Icons.arrow_drop_down),)
                      ],
                    ),)
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                    color: Colors.red,textColor: Colors.white,elevation: 0.2,
                  child: new Text('buy now'),
                ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.red,) ,onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border,color: Colors.red,) ,onPressed: (){})

            ],
            


          ),
          Divider(),
          new ListTile(
            title: new Text('Product details'),
            subtitle: new Text("good boy"),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
              child: new Text("Product name"),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                child: new Text("Product name"),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                child: new Text("Product brand"),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                child: new Text("Product condition"),)
            ],
          ),
          Divider(),
          SizedBox(height: 10,),
          Center(child: Text('Similar Products')),
SizedBox(height: 10,),
          Container(
            height: 300,
            child: Products(),
          )
        ],
      ),
    );
  }
}
