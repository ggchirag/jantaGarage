import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../book.dart';

class royal extends StatefulWidget{

  @override
  State<royal> createState() => _royalState();
}

class _royalState extends State<royal> {

  Future<void> CALL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "cannot launch $url";
    }
  }


  String royal = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FRoyal%2Froyal.png?alt=media&token=6f4ee71e-55e6-45c4-8ffc-bbddfc0d1a47';
  String r1 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FRoyal%2Fr1.jpg?alt=media&token=3508aab8-e83c-4374-b2e0-c6e43f268898';
  String r2 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FRoyal%2Fr2.jpg?alt=media&token=3508aab8-e83c-4374-b2e0-c6e43f268898';
  String r3 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FRoyal%2Fr3.jpg?alt=media&token=3508aab8-e83c-4374-b2e0-c6e43f268898';
  String r4 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FRoyal%2Fr4.jpg?alt=media&token=3508aab8-e83c-4374-b2e0-c6e43f268898';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Royal car AC'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: 'royal',
                child:Stack(
                  children: [
                    CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(royal),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(r1),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(r2),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //4th Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(r3),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //5th Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(r4),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 200,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 18 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.9,
                      ),
                    ),

                  ],
                )
            ),
            SizedBox(height: 10,),
            Expanded(
                child: Container(
                    width: double.infinity,
                    color: Colors.white ,
                    child:Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: double.infinity,
                                child: Text('Royal Car AC',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                padding:EdgeInsets.all(10),
                              ),
                              Container(
                                  height: 40,
                                  padding:EdgeInsets.all(10),
                                  child: Text('Sanskar Mandal, Bhavnagar',style: TextStyle(fontSize: 15,color: Colors.grey),)
                              ),
                              Container(
                                  height: 50,
                                  padding:EdgeInsets.all(10),
                                  child: Text('Open 24 Hrs',style: TextStyle(fontSize: 20,color: Colors.green))
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                        height: 50,
                                        alignment: Alignment.topRight,
                                        padding:EdgeInsets.all(10),
                                        child: ElevatedButton.icon(onPressed: (){
                                          CALL("tel:7096931267");                                        },
                                          icon: Icon(Icons.phone),
                                          label: Text('Call'),style: ElevatedButton.styleFrom(primary:Colors.indigo),)
                                    ),
                                    Container(
                                        height: 50,
                                        alignment: Alignment.topRight,
                                        padding:EdgeInsets.all(10),
                                        child: ElevatedButton.icon(onPressed: (){
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => bookgarage(),));
                                        },
                                          icon: Icon(Icons.book_online),
                                          label: Text('Book'),style: ElevatedButton.styleFrom(primary:Colors.indigo),)
                                    ),
                                    Container(
                                        height: 50,
                                        alignment: Alignment.topRight,
                                        padding:EdgeInsets.all(10),
                                        child: ElevatedButton.icon(onPressed: (){},
                                          icon: Icon(Icons.feedback,color: Colors.blueAccent),
                                          label: Text('Give FeedBack',style: TextStyle(color: Colors.blueAccent),),style: ElevatedButton.styleFrom(primary:Colors.white),)
                                    )
                                  ],
                                ),
                              ),


                            ]
                        ),
                        SizedBox(height: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50,
                              child: Text('Quick Infomation',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold)),
                              padding: EdgeInsets.all(10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  padding: EdgeInsets.all(10),
                                  child:Text('Mode of Payment',style: TextStyle(fontSize: 20,color: Colors.grey),),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  padding: EdgeInsets.all(10),
                                  child: Text('Cash , Dabit Card , Visa Card , Bhim , Phonepay ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: double.infinity,
                              child: Text('Service',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 10,),

                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: double.infinity,
                              child: Text('Coustomer Friendly Service Stations',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ),

                          ],
                        )
                      ],
                    )


                )
            ),
          ],
        ),

      ),
    );
  }
}