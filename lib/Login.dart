import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home_page.dart';
import 'Regestration.dart';
import 'getstartedscreen.dart';


enum  Loginscreen{
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET,
  SHOW_PROGRESS_WIDGET,
}
class LoginScreen extends StatefulWidget {
    @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  Loginscreen currentState = Loginscreen.SHOW_MOBILE_ENTER_WIDGET;
   FirebaseAuth _auth = FirebaseAuth.instance;
   String verificationID = "";
  bool buttonenabled = true;


  void SignOutME() async{
    await _auth.signOut();
  }


  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async
  {

    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if(authCred.user != null)
      {
        DatabaseReference db;
        db = FirebaseDatabase.instance.reference();
        db.child("user").once().then((DatabaseEvent  snapshot){
          Map<dynamic, dynamic>? values = snapshot.snapshot.value as Map?;
          values?.forEach((key,values) async {
            if(values["mobile"] == phoneController.text){
              final SharedPreferences sharedpriferences =  await SharedPreferences.getInstance();
              sharedpriferences.setString('name', values['name']);
              sharedpriferences.setString('address', values['address']);
              sharedpriferences.setString('mobile', values['mobile']);
              sharedpriferences.setString('email', values['email']);
              sharedpriferences.setString('pincode', values['pincode']);
            }
          });
        });
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home()));
      }
    } on FirebaseAuthException catch (e) {

      print(e.message);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check OTP')));
    }
  }
  showMobilePhoneWidget(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Text("Verify Your Phone Number" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 7,),
        SizedBox(height: 20,),
        Center(
          child:Container(
            margin: EdgeInsets.all(25),
            child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), ),
                      hintText: "Enter Your PhoneNumber",
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      suffixIcon: Icon(Icons.phone)
                  ),
              validator: (value) {
                if (value!.isEmpty){
                  return 'Enter Mobile No';
                }
                  return null;
              },
              onSaved: (value) {
                phoneController = value! as TextEditingController;
              },


                ),

            ),
          ),

        SizedBox(height: 20,),
        ElevatedButton(onPressed:buttonenabled?()  async{

          if(phoneController.text.length<10){
            return;
          }
          setState(() { //setState to refresh UI
            if(buttonenabled){
              buttonenabled = false;
              //if buttonenabled == true, then make buttonenabled = false
            }else{
              buttonenabled = true;
              //if buttonenabled == false, then make buttonenabled = true
            }
          });
          //if buttonenabled == true then pass a function otherwise pass "null"
          print("Elevated Button One pressed");

          DatabaseReference db;
          db = FirebaseDatabase.instance.reference();
          db.child("user").once().then((DatabaseEvent  snapshot){
            Map<dynamic, dynamic>? values = snapshot.snapshot.value as Map?;
            values?.forEach((key,values) async {
              if(values["mobile"] == phoneController.text){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Sending OTP..."
                      ""),
                ));
                    await _auth.verifyPhoneNumber(

                  phoneNumber: "+91${phoneController.text}",
                  verificationCompleted: (phoneAuthCredential) async{


                  },
                  verificationFailed: (verificationFailed){
                    print(verificationFailed);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('verificationFailed!!')));

                  },

                  codeSent: (verificationID, resendingToken) async{
                    setState(() {

                      currentState = Loginscreen.SHOW_OTP_FORM_WIDGET;
                      this.verificationID = verificationID;
                    });
                  },

                  codeAutoRetrievalTimeout: (verificationID) async{

                  }
                );
              }
            });
          });

        }:null, child: Text("Send OTP")),
        SizedBox(height: 16,),


        SizedBox(height: 16,),
        Spacer(),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Not An Account?'),
                  SizedBox(width: 8,),
                  InkWell(onTap: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => regestraation(),) );
                  },
                      child: Text('Sign up',style: TextStyle(color: Colors.indigo),))

                ],
              ),
            )
        )
      ],
    );
  }


  showOtpFormWidget(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Text("ENTER YOUR OTP" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 7,),
        SizedBox(height: 20,),
        Center(
          child:Container(
            margin: EdgeInsets.all(25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12) ),
                  hintText: "Enter Your OTP"
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);
          signInWithPhoneAuthCred(phoneAuthCredential);
        }, child: Text("Verify")),
        SizedBox(height: 16,),
        Spacer(),
        SizedBox(height: 40,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Diden`t Recve An OTP'),
              TextButton(onPressed: (){}, child: const Text('Resend'))
            ],
          ),


      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: currentState == Loginscreen.SHOW_MOBILE_ENTER_WIDGET ? showMobilePhoneWidget(context) : showOtpFormWidget(context),
    );
  }
}

class PostModel {
}
  TextEditingController phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late String _mobile, _password;
  late String verificationId;



