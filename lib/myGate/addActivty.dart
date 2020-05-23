import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view/flutterfirebasepractise/status_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
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
    String docId=Firestore.instance.collection("Activity").document().documentID;
    statusModel.docid=docId;
    await Firestore.instance.collection("Activity").document(statusModel.docid).setData(statusModel.toMap());
    Fluttertoast.showToast(msg: "status uploaded");
    Navigator.pop(context);
    return imageUpload;
  }
  Future<dynamic> uploadImage() async{
    StorageReference storageReference=await FirebaseStorage().ref().child("Activity");
    StorageUploadTask storageUploadTask =await storageReference.child("stat_"+DateTime.now().toIso8601String()).putFile(_imageFile);
    StorageTaskSnapshot snapshot=await storageUploadTask.onComplete;
    var downloadURL=await snapshot.ref.getDownloadURL();
    print("download url $downloadURL");
    return downloadURL;
  }
}
