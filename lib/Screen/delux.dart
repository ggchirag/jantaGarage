import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../book.dart';

class DeluxScreen extends StatefulWidget {
  const DeluxScreen({Key? key}) : super(key: key);

  @override
  State<DeluxScreen> createState() => _DeluxScreenState();
}

class _DeluxScreenState extends State<DeluxScreen> {
  Future<void> CALL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "cannot launch $url";
  }
}

  String delux = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FDelux%2Fdelux.png?alt=media&token=eb797594-5227-4ff0-a099-09ff19ffa2ea';
  String d1 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FDelux%2Fd1.jpg?alt=media&token=ee3d67fc-e550-4050-887d-fc92992cd107';
  String d2 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FDelux%2Fd2.jpg?alt=media&token=65467b6a-d462-4a76-b82e-221425101e7a';
  String d3 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FDelux%2Fd3.jpg?alt=media&token=c2e64ce4-6076-424b-9cf8-7fa29426e2cd';
  String d4 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FDelux%2Fd4.jpg?alt=media&token=4fd9ea76-ece1-4b10-9dc6-1d0fa2d4a1a3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delux car Care'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: 'delux',
                child:Stack(
                  children: [
                    CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(d1),
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
                              image: NetworkImage(delux),
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
                              image: NetworkImage(d2),
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
                              image: NetworkImage(d3),
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
                              image: NetworkImage(d4),
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
                                child: Text('Delux Car Care',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                padding:EdgeInsets.all(10),
                              ),
                              Container(
                                  height: 40,
                                  padding:EdgeInsets.all(10),
                                  child: Text(' Near Lakhubha Hall , Bhavnagar',style: TextStyle(fontSize: 15,color: Colors.grey),)
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
                                          CALL("tel:7947424096");
                                        },
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
