import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ankur extends StatefulWidget{
  @override
  State<ankur> createState() => _ankurState();
}

class _ankurState extends State<ankur> {

  String ankur = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Towing%2Fankur.png?alt=media&token=916581e2-dc9b-4ba6-aea7-f547c0007bbe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ankur crane Service'),
      ),
      body: Container(
        child: Hero(
          tag: 'ankur',
          child: Image(image: NetworkImage(ankur),),
        ),
      ),
    );
  }
}