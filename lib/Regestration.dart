import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jantagarage/Home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';


class regestraation extends StatefulWidget {
  @override
  State<regestraation> createState() => _regestraationState();
}

class _regestraationState extends State<regestraation> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  Loginscreen currentState = Loginscreen.SHOW_MOBILE_ENTER_WIDGET;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationID = "";

  late DatabaseReference dbRef;
  var namecontroller = new TextEditingController();
  var addresscontroller = new TextEditingController();
  var mobilecontroller = new TextEditingController();
  var emailcontroller = new TextEditingController();
  var pincodeconntrller = new TextEditingController();
  var passwordcontroller = new TextEditingController();
  var confirmpasscontroller = new TextEditingController();

  bool _validate = true;
  bool isLoading = true;
  String _email="";
  String  _password="";
  final _key = GlobalKey();

  late String _name;

  void initState(){
    super.setState(() {
      dbRef = FirebaseDatabase.instance.ref().child('user');
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('Registration Form'),
          leading: InkWell(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));},
              child: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('Registration',style: TextStyle(fontSize:21,color: Colors.black,fontWeight:FontWeight.bold),),
                    // SizedBox(height: 15,),
                    TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        label: Text('Enter Full Name'),
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                        // errorText: _validate? 'value can\'t be empty' : "",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          _formKey.currentState!.save();
                          /*if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            return 'value can`t be empty';
                          }*/
                          return 'Name can`t be empty';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        namecontroller.text = value!;
                      },
                      // validator: (value) {
                      //   if(value!.isEmpty){
                      //     return 'Please Enter Your Name';
                      //   }
                      //   return null;
                      // },
                      // onSaved: (value) {
                      //   namecontroller.text = value!;
                      // },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: mobilecontroller,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                        label: Text('Enter Mobile Number'),
                        suffixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(21)),
                      ),
                       validator: (value){
                        if(value!.isEmpty){
                          _formKey.currentState!.save();
                          return 'Please enter mobile number ';

                        }
                        return null;
                        },
                      onSaved: (value){
                        mobilecontroller.text = value!;
                      },
                    ),  // Mobile Number
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(label: Text('Entre Your Email'),
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(21)),
                          suffixIcon: Icon(Icons.email)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          _formKey.currentState!.save();
                          return 'Please enter email ';
                        }
                        return null;
                      },
                      onSaved: (value){
                        emailcontroller.text = value!;
                      },
                    ), // Email
                    SizedBox(height: 15,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: pincodeconntrller,
                      decoration: InputDecoration(
                        label: Text('Enter Pincode'),
                        suffixIcon: Icon(Icons.pin),
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(21)),

                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          _formKey.currentState!.save();
                          return 'Please enter pincode ';
                        }
                        return null;
                        },
                      onSaved: (value){
                        pincodeconntrller.text = value!;
                      },
                    ), // Pincode
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: addresscontroller,
                      decoration: InputDecoration(
                        label: Text('Enter Address'),
                        suffixIcon: Icon(Icons.home_filled),
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(21)),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          _formKey.currentState!.save();
                          return 'Please Enter Address';
                        }
                        return null;
                      },
                      onSaved: (value){
                        addresscontroller.text = value!;
                      },
                    ),  // Address
                    SizedBox(height: 15,),

                    ElevatedButton(onPressed: () async {

                      setState(() {
                        namecontroller.text.isEmpty ? _validate = true : _validate = false;
                        mobilecontroller.text.isEmpty ? _validate = true : _validate = false;
                        pincodeconntrller.text.isEmpty ? _validate = true : _validate = false;
                        addresscontroller.text.isEmpty ? _validate = true : _validate = false;
                        emailcontroller.text.isEmpty ? _validate = true : _validate = false;
                      });

                      final SharedPreferences sharedpriferences =  await SharedPreferences.getInstance();
                      sharedpriferences.setString('name', namecontroller.text);
                      sharedpriferences.setString('address', addresscontroller.text);
                      sharedpriferences.setString('mobile', mobilecontroller.text);
                      sharedpriferences.setString('email', emailcontroller.text);
                      sharedpriferences.setString('pincode', pincodeconntrller.text);

                       // Get.to(Home());

                      if(namecontroller.text.isNotEmpty && addresscontroller.text.isNotEmpty && mobilecontroller.text.isNotEmpty && emailcontroller.text.isNotEmpty && pincodeconntrller.text.isNotEmpty){
                        insertData(namecontroller.text, addresscontroller.text, mobilecontroller.text, emailcontroller.text, pincodeconntrller.text, passwordcontroller.text);

                      }
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Do something with the form data
                      }

                       // Navigator.pop(context, MaterialPageRoute(builder: (context) => Home(),));
                      if(!_validate)
                        {

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
                        }
                    },
                        child: Text('Submit')),
                    SizedBox(height: 20,),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Alredy An Account?'),
                              SizedBox(width: 7,),
                              InkWell(onTap:(){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                              } ,
                                  child: Text('sign in',style: TextStyle(color: Colors.indigo),))

                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
        )



    );
  }
 void insertData(String name,String add,String mob,String email,String pin,String pass,){
    dbRef.child(mob).set({
      'name' : name,
      'address' : add,
      'mobile' : mob,
      'email' : email,
      'pincode' : pin,
      'url' : '',

    });
    namecontroller.clear();
    addresscontroller.clear();
    mobilecontroller.clear();
    emailcontroller.clear();
    pincodeconntrller.clear();
    passwordcontroller.clear();

 }
}
