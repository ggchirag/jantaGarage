import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashmesh extends StatefulWidget{
  @override
  State<dashmesh> createState() => _dashmeshState();
}

class _dashmeshState extends State<dashmesh> {
  String dashmesh = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Towing%2Fdashmesh.png?alt=media&token=e50c97a1-13da-4edf-a2ea-379339b814f6';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashmesh Break Down'),
      ),
      body: Container(
        child: Hero(
          tag: 'dashmesh',
          child: Image(image: NetworkImage(dashmesh),),
        ),
      ),
    );
  }
}