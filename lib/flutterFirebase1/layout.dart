
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main()=>runApp(MaterialApp(
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.cyan
  ),
  home: MyApp(),
));
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String studentName,studentId,branchId,specalization;
  double studentCGPA;
  getStudentName(name){
    this.studentName=name;
  }
  getStudentId(id){
    this.studentId=id;
  }
  getBranchId(branchId){
    this.branchId=branchId;
  }
  getSpecalization(specal){
    this.specalization=specal;
  }
  getStudentCGPA(cgpa){
    this.studentCGPA=double.parse(cgpa);
  }
  createData(){
    print("created");
    DocumentReference documentReference =Firestore.instance.collection("MyStudents").document(studentName);
    Map<String, dynamic> students={
      "studentName": studentName,
      "studentId":studentId,
      "branchId":branchId,
      "specalization":specalization,
      "studentCGP":studentCGPA
    };
    documentReference.setData(students).whenComplete((){
      print("$studentName created");
    });
  }
  readData(){
    print("reading");
    DocumentReference documentReference =Firestore.instance.collection("MyStudents").document(studentName);
    documentReference.get().then((datasnapshot){
      print(datasnapshot.data["studentName"]);
      print(datasnapshot.data["studentId"]);
      print(datasnapshot.data["branchId"]);
      print(datasnapshot.data["specalization"]);
      print(datasnapshot.data["studentCGPA"]);

    });



    }
  updateData(){
    print("updated");
    DocumentReference documentReference =Firestore.instance.collection("MyStudents").document(studentName);
    Map<String, dynamic> students={
      "studentName": studentName,
      "studentId":studentId,
      "branchId":branchId,
      "specalization":specalization,
      "studentCGP":studentCGPA
    };
    documentReference.setData(students).whenComplete((){
      print("$studentName updated");
    });
  }
  deleteData(){
    print("deleted");
    DocumentReference documentReference=Firestore.instance.collection("MyStudents").document(studentName);
    documentReference.delete().whenComplete((){
      print("$studentName deleted");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My College Details"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,width: 2.0)
                  )
                ),
                onChanged: (String name) {
                  getStudentName(name);
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Student Id",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2.0)
                    )
                ),
                onChanged: (String id){
                  getStudentId(id);
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Branch Id",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2.0)
                    )
                ),
                onChanged: (String branchId){
                  getBranchId(branchId);
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "CGPA",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2.0)
                    )
                ),
                onChanged: (String cgpa){
                  getStudentCGPA(cgpa);
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Specalization",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2.0)
                    )
                ),
                onChanged: (String specal){
                  getSpecalization(specal);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text("create"),
                  textColor: Colors.white,
                  onPressed: (){
                    createData();
                  },
                ),
                RaisedButton(
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text("read"),
                  textColor: Colors.white,
                  onPressed: (){
                   readData();
                  },
                ),
                RaisedButton(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text("update"),
                  textColor: Colors.white,
                  onPressed: (){
                    updateData();
                  },
                ),

              ],
            ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            color: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            ),
            child: Text("delete"),
            textColor: Colors.white,
            onPressed: (){
              deleteData();
            },
          ),
          ],
      ),


          ],
        ),
      ),
    );
  }
}
