// import 'package:flutter/material.dart';
//
// import 'dart:async';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   late String phoneNumber, verificationId;
//   late String otp, authStatus = "";
//
//   Future<void> verifyPhoneNumber(BuildContext context) async {
//     var instance;
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       timeout: const Duration(seconds: 15),
//       verificationCompleted: (AuthCredential authCredential) {
//         setState(() {
//           authStatus = "Your account is successfully verified";
//         });
//       },
//       verificationFailed: (AuthException authException) {
//         setState(() {
//           authStatus = "Authentication failed";
//         });
//       },
//       codeSent: (String verId, [forceCodeResent]) {
//         verificationId = verId;
//         setState(() {
//           authStatus = "OTP has been successfully send";
//         });
//         otpDialogBox(context).then((value) {});
//       },
//       codeAutoRetrievalTimeout: (String verId) {
//         verificationId = verId;
//         setState(() {
//           authStatus = "TIMEOUT";
//         });
//       },
//     );
//   }
//
//   otpDialogBox(BuildContext context) {
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return new AlertDialog(
//             title: Text('Enter your OTP'),
//             content: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   border: new OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(
//                       const Radius.circular(30),
//                     ),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   otp = value;
//                 },
//               ),
//             ),
//             contentPadding: EdgeInsets.all(10.0),
//             actions: <Widget>[
//               FlatButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   signIn(otp);
//                 },
//                 child: Text(
//                   'Submit',
//                 ),
//               ),
//             ],
//           );
//         });
//   }
//
//   Future<void> signIn(String otp) async {
//     var instance;
//     await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.getCredential(
//       verificationId: verificationId,
//       smsCode: otp,
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.2,
//             ),
//             Text(
//               "Phone Auth demo📱",
//               style: TextStyle(
//                 color: Colors.cyan,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Image.network(
//               "https://avatars1.githubusercontent.com/u/41328571?s=280&v=4",
//               height: 150,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 keyboardType: TextInputType.phone,
//                 decoration: new InputDecoration(
//                     border: new OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                         const Radius.circular(30),
//                       ),
//                     ),
//                     filled: true,
//                     prefixIcon: Icon(
//                       Icons.phone_iphone,
//                       color: Colors.cyan,
//                     ),
//                     hintStyle: new TextStyle(color: Colors.grey[800]),
//                     hintText: "Enter Your Phone Number...",
//                     fillColor: Colors.white70),
//                 onChanged: (value) {
//                   phoneNumber = value;
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             RaisedButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30)),
//               onPressed: () =>
//               phoneNumber == null ? null : verifyPhoneNumber(context),
//               child: Text(
//                 "Generate OTP",
//                 style: TextStyle(color: Colors.white),
//               ),
//               elevation: 7.0,
//               color: Colors.cyan,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text("Need Help?"),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Please enter the phone number followed by country code",
//               style: TextStyle(color: Colors.green),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               authStatus == "" ? "" : authStatus,
//               style: TextStyle(
//                   color: authStatus.contains("fail") ||
//                       authStatus.contains("TIMEOUT")
//                       ? Colors.red
//                       : Colors.green),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// RaisedButton({required RoundedRectangleBorder shape, required Future<void>? Function() onPressed, required Text child, required double elevation, required MaterialColor color}) {
// }
//
// FlatButton({required Null Function() onPressed, required Text child}) {
// }
//
// class PhoneAuthProvider {
//   static getCredential({required String verificationId, required String smsCode}) {}
// }
//
//
//
// class AuthException {
// }
//
// class AuthCredential {
// }
//
// class FirebaseAuth {
//   static var instance;
// }