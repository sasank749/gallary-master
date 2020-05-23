import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn=new GoogleSignIn();
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  SharedPreferences preferences;
  bool Loading=false;
  bool isLogedIn=false;

  @override
  void initState(){
    super.initState();
    isSignedIn();
  }
  void isSignedIn() async{
    setState(() {
      Loading=true;
    });
    preferences=await SharedPreferences.getInstance();
    isLogedIn=await googleSignIn.isSignedIn();

    if(isLogedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    }
    setState(() {
      Loading = false;
    });

  }
  Future handleSignIn() async{
    preferences=await SharedPreferences.getInstance();
    setState(() {
      Loading=true;
    });
    GoogleSignInAccount googleUser=await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =await googleUser
        .authentication;
    FirebaseUser firebaseUser=await firebaseAuth.signInWithGoogle(
      idToken:googleSignInAuthentication.idToken, accessToken:googleSignInAuthentication.accessToken);
    if(firebaseUser!=null){

    }

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
