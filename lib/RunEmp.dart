import 'package:flutter/material.dart';
import 'package:flutter_view/MainEmp.dart';
import 'MainEmp.dart';



class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DbEmployeeManager dbmanager = new DbEmployeeManager();

  final _nameController = TextEditingController();
  final _deptController = TextEditingController();
  final _AddressController = TextEditingController();

  final _formKey = new GlobalKey<FormState>();
  Employee employee;
  List<Employee> studlist;
  int updateIndex;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite Demo'),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: new InputDecoration(labelText: 'Name', icon: const Icon(Icons.person)),
                    controller: _nameController,
                    validator: (val) =>
                    val.isNotEmpty ? null : 'Name Should Not Be empty',
                  ),
                  TextFormField(
                    decoration: new InputDecoration(labelText: 'dept', icon: const Icon(Icons.departure_board)),
                    controller: _deptController,
                    validator: (val) =>
                    val.isNotEmpty ? null : 'dept Should Not Be empty',
                  ),
                  TextFormField(
                    decoration: new InputDecoration(labelText: 'Address', icon: const Icon(Icons.email)),
                    controller: _AddressController,
                    validator: (val) =>
                    val.isNotEmpty ? null : 'Address Should Not Be empty',
                  ),

                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    child: Container(
                        width: width * 0.9,
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () {
                      _submitEmployee(context);
                    },
                  ),
                  FutureBuilder(
                    future: dbmanager.getEmployeeList(),
                    builder: (context,snapshot){
                      if(snapshot.hasData) {
                        studlist = snapshot.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: studlist == null ?0 : studlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            Employee st = studlist[index];
                            return Card(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: width*0.6,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Name: ${st.name}',style: TextStyle(fontSize: 15),),
                                        Text('dept: ${st.dept}', style: TextStyle(fontSize: 15, color: Colors.black54),),
                                        Text('Address: ${st.Address}', style: TextStyle(fontSize: 15, color: Colors.black54),),

                                      ],
                                    ),
                                  ),

                                  IconButton(onPressed: (){
                                    _nameController.text=st.name;
                                    _deptController.text=st.dept;
                                    _AddressController.text=st.dept;

                                    employee=st;
                                    updateIndex = index;
                                  }, icon: Icon(Icons.edit, color: Colors.blueAccent,),),
                                  IconButton(onPressed: (){
                                    dbmanager.deleteEmployee(st.id);
                                    setState(() {
                                      studlist.removeAt(index);
                                    });
                                  }, icon: Icon(Icons.delete, color: Colors.red,),)

                                ],
                              ),
                            );
                          },

                        );
                      }
                      return new CircularProgressIndicator();
                    },
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitEmployee(BuildContext context) {
    if(_formKey.currentState.validate()){
      if(employee==null) {
        Employee st = new Employee(name: _nameController.text, dept: _deptController.text,Address: _AddressController.text,);
        dbmanager.insertEmployee(st).then((id)=>{
          _nameController.clear(),
          _deptController.clear(),
          _AddressController.clear(),

          print('Employee Added to Db ${id}')
        });
      } else {
        employee.name = _nameController.text;
        employee.dept = _deptController.text;
        employee.Address=_AddressController.text;

        dbmanager.updateEmployee(employee).then((id) =>{
          setState((){
            studlist[updateIndex].name = _nameController.text;
            studlist[updateIndex].dept= _deptController.text;
            studlist[updateIndex].Address= _AddressController.text;

          }),
          _nameController.clear(),
          _deptController.clear(),
          _AddressController.clear(),

          employee=null
        });
      }
    }
  }
}