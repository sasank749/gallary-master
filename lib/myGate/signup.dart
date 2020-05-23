import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'homescreen.dart';
import 'loginscreen.dart';
import 'MyScreen.dart';
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email, _password;

  var _formkey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Sign Up"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        margin: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Text('Please signup to your account'),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (item) {
                    return item.contains("@")
                        ? null
                        : "Enter valid Email";
                  },
                  onChanged: (item) {
                    setState(() {
                      _email = item;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      labelText: "Email",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (item) {
                    return item.length > 6
                        ? null
                        : "Password must be 6 characters";
                  },
                  onChanged: (item) {
                    setState(() {
                      _password = item;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      signup();
                    },
                    child: Text(
                      "Register",
                    ),
                    textColor: Colors.white,
                  ),
                ),
                Container(
                  height: 100,
                  width: 300,
                  color: Colors.red,

                  child: Card(


                    child: Column(

                      children: <Widget>[
                        Text(
                            'MyGate'

                        ),
                        Column(
                          children: <Widget>[
                            Text('Deoes not sell or trade your data'),
                            Text('Is iso 27001 certified for information secutity'),
                            Text('Encrypted and secures and data')
                          ],
                        )
                      ],
                    ),

                  ),
                ),
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {},
                  child: const Text(
                      'Request Otp',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    children: <Widget>[
                      Text('Already hava an account ?'),
                      Container(child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) =>  LoginScreen()));
                          },
                          child: Text("    "+"Login here")),alignment: Alignment.centerRight,),
                    ],
                  ),
                ),

              ],
            )),
      ),
    );
  }

  void signup() {
    if (_formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        // sign up
        setState(() {
          isLoading = false;
        });

        Fluttertoast.showToast(msg: "Register Success");

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
                (Route<dynamic> route) => false);
      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "error " + onError.toString());
      });
    }
  }}
