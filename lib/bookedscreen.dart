import 'package:flutter/material.dart';
import 'Home_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// import 'home_button.dart';

class booked extends StatefulWidget {
  const booked({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<booked> createState() => _bookedState();
}

Color themeColor = Colors.indigo;

class _bookedState extends State<booked> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Booked'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/card.png?alt=media&token=4c94a706-7882-4dde-9c4d-de6037bdf4b8",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Thank You!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Garage Booked  Successfully",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Text(
                "Your request is collected , We will start processing it very soon and we  Contact You  if nedded",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Home(),));
              },
              child: Text('Home'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
              ),
              ),
          ],
        ),
      ),
    );
  }
}