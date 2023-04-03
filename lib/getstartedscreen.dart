import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jantagarage/Home_page.dart';
import 'package:jantagarage/Login.dart';
import 'dart:core';

import 'package:jantagarage/Regestration.dart';


class started extends StatefulWidget {
  const started({Key? key}) : super(key: key);

  @override
  State<started> createState() => _startedState();
}

class _startedState extends State<started> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        // By defaut, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 120),
                   width: double.infinity,
                  height: 500,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/images/backg.jpg",
                        ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(25,0,25,20),
                    child: Card(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 60,
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: const Text(
                          'Get\'Started',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => regestraation(),));
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(25,0,25,20),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(width: 2,style:BorderStyle.solid,color: Colors.indigo )
                      ),
                      child: Container(

                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 60,
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: const Text(
                          'Not have an Account?',
                          style: TextStyle(fontSize: 20,color: Colors.indigo)),
                        ),
                      ),
                    ),
                  ),

              ],
            )
        )
    );
  }
}
