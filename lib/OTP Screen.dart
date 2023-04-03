// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jantagarage/Home_page.dart';
import 'package:jantagarage/Login.dart';

import 'main.dart';
class otpscreen extends StatefulWidget {
 const otpscreen({Key? key}) : super(key: key);

  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  // Future registerUser(String mobile, BuildContext context) async{
  //
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //   _auth.verifyPhoneNumber(
  //       phoneNumber: mobile,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (PhoneAuthCredential phoneAuthCredential) { Navigator.pushReplacement(context, MaterialPageRoute(
  //           builder: (context) => Home()
  //       ));  },
  //       verificationFailed: (FirebaseAuthException error) {  },
  //       codeSent: (String verificationId, int? forceResendingToken) {  },
  //       codeAutoRetrievalTimeout: (String verificationId) {  },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));},
          child: Icon(Icons.arrow_back,color:Colors.black
            ,),
        ),
        title: Text('Verify Screen',style: TextStyle(
          color: Colors.black87
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'OTP Sent to 7096931267',
                  style: TextStyle(color: Colors.grey,
                  fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Form(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 54,
                  height: 54,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters:[LengthLimitingTextInputFormatter(1)],
                    style: TextStyle(
                      color: Colors.black,fontSize: 30
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 54,
                  height: 58,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters:[LengthLimitingTextInputFormatter(1)],
                    style: TextStyle(
                        color: Colors.black,fontSize: 30
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 54,
                  height: 58,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters:[LengthLimitingTextInputFormatter(1)],
                    style: TextStyle(
                        color: Colors.black,fontSize: 30
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 54,
                  height: 58,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters:[LengthLimitingTextInputFormatter(1)],
                    style: TextStyle(
                        color: Colors.black,fontSize: 30
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),



              ],
            )
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Dident Recive a OTP? Resend OTP',
                      style: TextStyle(color: Colors.grey,
                          fontSize: 20),
                    ),
                    TextButton(onPressed: (){},
                        child: Text('Resend OTP',style: TextStyle(fontSize: 16 ,color: Colors.black),))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
            },
            child: Text('Verify',style:TextStyle(fontSize: 20,color: Colors.black),),
            style: ElevatedButton.styleFrom(
                elevation: 4,
                primary: Colors.blueGrey,
                padding: EdgeInsets.all(20)),

            ),
      ),
    );
  }
}
