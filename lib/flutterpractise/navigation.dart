import 'package:flutter/material.dart';
import 'package:flutter_view/flutterpractise/FirstScreen.dart';
void main()=>runApp(
    MaterialApp(
        title: 'hello',
        color: Colors.yellow,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green
        ),
        home: FirstScreen()
    )
);
