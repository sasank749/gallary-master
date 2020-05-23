import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view/flutterfirebasepractise//login_screen.dart';
import 'package:flutter_view/flutterfirebasepractise/status_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'registration_screen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseuser){
      if(firebaseuser==null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginScreen()), (Route<dynamic>rr)=>false);
      }
      else{
        //User already logged in
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){

            FirebaseAuth.instance.signOut().then((onValue){
              Navigator.push(context, MaterialPageRoute(builder: (_) => RegistrationScreen() ));

            });

          })
        ],
      ),
      body: StreamBuilder(

        stream: Firestore.instance.collection("statuses").snapshots(),
           builder:(context,snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          if(snapshot.data.documents.length==0){
            return Text("no data");
          }
          return ListView.builder(itemCount: snapshot.data.documents.length,itemBuilder:(context,index){
          return Card(
            child: ListTile(
              leading: Image.network(snapshot.data.documents[index].data["imageURL"]),
              title:Text(snapshot.data.documents[index].data["message"]),
              subtitle:Text(snapshot.data.documents[index].data["title"]),

            ),
          );
          });
           }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>UploadStatus()));
      },
      child: Icon(Icons.add_a_photo),),
    );
  }
}
class UploadStatus extends StatefulWidget {
  @override
  _UploadStatusState createState() => _UploadStatusState();
}

class _UploadStatusState extends State<UploadStatus> {
   File _imageFile=null;
   TextEditingController _titleEditingController=TextEditingController();
   TextEditingController _messageEditingController=TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("upload status")),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _imageFile==null?Text('no file choosen'):Image.file(_imageFile),
            SizedBox(height: 20,),
            Center(
              child: RaisedButton(onPressed: (){
                pickImage();
              },child: Text("choose image"),),



            ),
            SizedBox(height: 20,),
            TextField(
              controller: _titleEditingController,
              decoration:InputDecoration(
                hintText: "enter title",
                labelText: "title",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _messageEditingController,
              decoration:InputDecoration(
                  hintText: "enter message",
                  labelText: "message",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(onPressed: (){
              uploadStatus();
            },child: Text("Upload status"),),
          ],
        ),
      ),

    );
  }
  Future pickImage() async{
    var file=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile=file;
    });
  }
  Future uploadStatus() async {
     var imageUpload=await uploadImage();
     StatusModel statusModel=new StatusModel();
     statusModel.imageURL=imageUpload.toString();
     statusModel.title=_titleEditingController.text;
     statusModel.message=_messageEditingController.text;
     String docId=Firestore.instance.collection("statuses").document().documentID;
     statusModel.docid=docId;
     await Firestore.instance.collection("statuses").document(statusModel.docid).setData(statusModel.toMap());
     Fluttertoast.showToast(msg: "status uploaded");
     Navigator.pop(context);
     return imageUpload;
  }
 Future<dynamic> uploadImage() async{
    StorageReference storageReference=await FirebaseStorage().ref().child("statuses");
    StorageUploadTask storageUploadTask =await storageReference.child("stat_"+DateTime.now().toIso8601String()).putFile(_imageFile);
    StorageTaskSnapshot snapshot=await storageUploadTask.onComplete;
    var downloadURL=await snapshot.ref.getDownloadURL();
    print("download url $downloadURL");
    return downloadURL;
   }
}
