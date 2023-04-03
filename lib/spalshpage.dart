import 'dart:async';
import 'dart:core';
import 'package:get/get.dart';
import 'package:jantagarage/Home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'getstartedscreen.dart';

late String finalname;
late String finalemail;
class Spalshscreen extends StatefulWidget{
  @override
  State<Spalshscreen> createState() => _SpalshscreenState();

}

class _SpalshscreenState extends State<Spalshscreen> {

  @override
  void initState() {
    getValidationData();
    super.initState();
  }
  Future getValidationData() async{
    final SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
    var obtainedname = sharedPreferences.getString('name');
    var obtainedaddress = sharedPreferences.getString('address');
    var obtainedmobile = sharedPreferences.getString('mobile');
    var obtainedemail = sharedPreferences.getString('email');
    var obtainedpincode = sharedPreferences.getString('pincode');

    sharedPreferences.getString('name') == null ? finalname = "":finalname = obtainedname!;
    Timer(Duration(seconds: 2),() => finalname == "" ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => started())) :Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/JGlogo.jpeg"
                ),
              fit: BoxFit.fitWidth
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //  height: 200,
              //   width: 200,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     image: DecorationImage(
              //       image: AssetImage(
              //         "assets/images/JGlogo.jpeg"
              //       )
              //     )
              //   ),
              //
              // ),

             // Text('JANTA GARAGE',style: TextStyle(color: Colors.white,fontSize: 21,fontWeight:FontWeight.bold),),

            ],
          ),
        ),
      )
    );
  }
}