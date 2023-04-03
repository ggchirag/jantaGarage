import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class maruti extends StatefulWidget{
  @override
  State<maruti> createState() => _marutiState();
}

class _marutiState extends State<maruti> {
  String maruti = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Towing%2Fmaruti.png?alt=media&token=16bc085d-ec05-4aad-8517-00181c8ebef2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maruti Nandan crane Service'),
      ),
      body: Container(
        child: Hero(
          tag: 'maruti',
          child: Image(image: NetworkImage(maruti),),
        ),
      ),
    );
  }
}