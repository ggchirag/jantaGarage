import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:jantagarage/firebase_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jantagarage/Navbar.dart';
import 'package:jantagarage/spalshpage.dart';

import 'Home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janta Garage',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.indigo,
      ),
      home: Spalshscreen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

 class _MyHomePageState extends State<MyHomePage> {



   @override
   Widget build(BuildContext context) {
     return Scaffold(
      // drawer:Navbar(),
         appBar: AppBar(

           title: Text("Janta Garage"),
         ),
         body:Container()
     );
   }

 }
