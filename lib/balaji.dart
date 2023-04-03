import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class balaji extends StatefulWidget{
  @override
  State<balaji> createState() => _balajiState();
}

class _balajiState extends State<balaji> {
  String balaji = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Towing%2Fbalaji.png?alt=media&token=66ca31da-cd32-4379-b4f0-56b9ffb1b2e0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balaji A to Z Crane serice '),
      ),
      body: Container(
        child: Hero(
          tag: 'balaji',
          child: Image(image: NetworkImage(balaji),),
        ),
      ),
    );
  }
}