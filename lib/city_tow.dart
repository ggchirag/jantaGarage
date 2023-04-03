import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book.dart';

class city extends StatefulWidget{

  @override
  State<city> createState() => _cityState();
}

class _cityState extends State<city> {
  String city = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Towing%2Fcity.png?alt=media&token=7625bb24-5396-402f-8a34-816e74279f06';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Town'),
        ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(

                    tag: 'city',
                    child:Stack(
                      children: [
                        CarouselSlider(
                          items: [
                            Container(
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(city),
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
                                  image: NetworkImage(city),
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
                                  image: NetworkImage(city),
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
                                  image: NetworkImage(city),
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
                                  image: NetworkImage(city),
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
                                    child: Text('City Towing',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                    padding:EdgeInsets.all(10),
                                  ),
                                  Container(
                                      height: 40,
                                      padding:EdgeInsets.all(10),
                                      child: Text('Nari chowkdi , Bhavnagar',style: TextStyle(fontSize: 15,color: Colors.grey),)
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
                                              // setState(() {
                                              //   print('call');
                                              //   _makePhoneCall('tel:+91 7096931267');
                                              // });
                                            },
                                              icon: Icon(Icons.phone),
                                              label: Text('Call'),style: ElevatedButton.styleFrom(primary:Colors.indigo),)
                                        ),
                                        Container(
                                            height: 50,
                                            alignment: Alignment.topRight,
                                            padding:EdgeInsets.all(10),
                                            child: ElevatedButton.icon(onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => bookgarage(Title: 'City Tow',),));
                                            },
                                              icon: Icon(Icons.book_online),
                                              label: Text('Book'),style: ElevatedButton.styleFrom(primary:Colors.indigo),
                                            )
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