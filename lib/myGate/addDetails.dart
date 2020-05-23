import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}
class AddAddressCity extends StatefulWidget {
  @override
  _AddAdressCityState createState() => _AddAdressCityState();
}

class _AddAdressCityState extends State<AddAddressCity> {
  Item selectedUser;
  List<Item> users = <Item>[
    const Item('Flat/Villa',Icon(Icons.home,color:  const Color(0xFF167F67),)),
    const Item('Workplace',Icon(Icons.work,color:  const Color(0xFF167F67),)),

  ];
  Item selectedUser1;
  List<Item> users1 = <Item>[
     const Item('Hyderbad',Icon(Icons.location_city,color:  const Color(0xFF167F67),)),
    const Item('Banglore',Icon(Icons.location_city,color:  const Color(0xFF167F67),)),
    const Item('Mumbai',Icon(Icons.location_city,color:  const Color(0xFF167F67),)),
    const Item('Chennai',Icon(Icons.location_city,color:  const Color(0xFF167F67),)),
    const Item('Delhi',Icon(Icons.location_city,color:  const Color(0xFF167F67),)),
    const Item('Kolkatta',Icon(Icons.location_city,color:  const Color(0xFF167F67),)),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Type'),backgroundColor: Colors.redAccent,),
      body:  Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),

            Text('Type'),
            SizedBox(height: 20,),

            DropdownButton<Item>(
              hint:  Text("Type"),
              value: selectedUser,
              onChanged: (Item Value) {
                setState(() {
                  selectedUser = Value;
                });
              },
              items: users.map((Item user) {
                return  DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      user.icon,
                      SizedBox(width: 10,),
                      Text(
                        user.name,
                        style:  TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20,),
            Text('Home Town'),
            SizedBox(height: 20,),

            DropdownButton<Item>(
              hint:  Text("City"),
              value: selectedUser1,
              onChanged: (Item Value) {
                setState(() {
                  selectedUser1 = Value;
                });
              },
              items: users1.map((Item user) {
                return  DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      user.icon,
                      SizedBox(width: 10,),
                      Text(
                        user.name,
                        style:  TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20,),

            Text('Society'),
            SizedBox(height: 20,),
            TextFormField(

              decoration: const InputDecoration(
                icon: const Icon(
                  FontAwesomeIcons.search,
                  color: Color(0xff11b719),
                ),
                hintText: ' Scociety Name',
                labelText: 'Enter Society Name',
              ),
            ),


          ],
        ),
      ),

      );



  }
}

