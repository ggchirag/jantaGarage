import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../book.dart';

class vikram extends StatefulWidget{
  @override
  State<vikram> createState() => _vikramState();
}

class _vikramState extends State<vikram> {

  Future<void> CALL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "cannot launch $url";
    }
  }



  String vikram = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FVikram%2Fvikram.png?alt=media&token=8f230f26-d200-425c-b075-415c77d9c3b6';
  String v1 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FVikram%2Fv1.jpg?alt=media&token=6b882dba-8cca-4572-862e-fc5b1b493eea';
  String v2 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FVikram%2Fv2.jpg?alt=media&token=f5e2e84b-e019-4e3b-a9f1-46c5e3ed9355';
  String v3 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FVikram%2Fv3.jpg?alt=media&token=c2a69317-79ef-45ca-a5b6-4bbad175739c';
  String v4 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FVikram%2Fv4.jpg?alt=media&token=7c7935be-f685-4de2-af86-fed87842ea87';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vikram Moters'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: 'vikram',
                child:Stack(
                  children: [
                    CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(vikram),
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
                              image: NetworkImage(v1),
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
                              image: NetworkImage(v2),
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
                              image: NetworkImage(v3),
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
                              image: NetworkImage(v4),
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
                                child: Text('Vikram Moter Garage',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                padding:EdgeInsets.all(10),
                              ),
                              Container(
                                  height: 40,
                                  padding:EdgeInsets.all(10),
                                  child: Text('Vaghawadi Road , Bhavnagar',style: TextStyle(fontSize: 15,color: Colors.grey),)
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
                                          CALL("tel:7096931267");
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