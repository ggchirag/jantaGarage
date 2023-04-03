import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jantagarage/book.dart';
import 'package:url_launcher/url_launcher.dart';

class garages extends StatefulWidget  {
  String? Title;
  String? Address;
  String? QuickServices;
  String? Mobile;
  String? url;
  garages({Key? key,required this.Title,required this.Address,required this.QuickServices,required this.Mobile,required this.url}) : super(key: key);

  @override
  State<garages> createState() => _garagesState(Title: Title,Address:Address,QuickServices:QuickServices,Mobile:Mobile,url: url);
}

class _garagesState extends State<garages>  {

  String? Title;
  String? Address;
  String? QuickServices;
  String? Mobile;
  String? url;
  _garagesState({Key? key,required this.Title,required this.Address,required this.QuickServices,required this.Mobile,required this.url});
  Future<void> CALL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "cannot launch $url";
    }
  }


  String krishna = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FKrishna%2Fkrishna.png?alt=media&token=99dee310-4958-4c83-ba98-21dccff31d48';
  String k1 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FKrishna%2Fk1.jpg?alt=media&token=6bd7ef05-f772-4047-ba8c-1fccb4446a1b';
  String k2 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FKrishna%2Fk2.jpg?alt=media&token=b10483ed-6708-4e68-9508-680d2a7ffa03';
  String k3 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FKrishna%2Fk3.jpg?alt=media&token=b10483ed-6708-4e68-9508-680d2a7ffa03';
  String k4 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FKrishna%2Fk4.jpg?alt=media&token=b10483ed-6708-4e68-9508-680d2a7ffa03';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$Title'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Hero(
            //     tag: 'krishna',
            //     child:Stack(
            //       children: [
            //         CarouselSlider(
            //           items: [
            //             Container(
            //               margin: EdgeInsets.all(0.0),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(0.0),
            //                 image: DecorationImage(
            //                   image: NetworkImage(k1),
            //                   fit: BoxFit.fill,
            //                 ),
            //               ),
            //             ),
            //
            //             //2nd Image of Slider
            //             Container(
            //               margin: EdgeInsets.all(6.0),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(0.0),
            //                 image: DecorationImage(
            //                   image: NetworkImage(krishna),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //
            //             //3rd Image of Slider
            //             Container(
            //               margin: EdgeInsets.all(6.0),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(0.0),
            //                 image: DecorationImage(
            //                   image: NetworkImage(k2),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //
            //             //4th Image of Slider
            //             Container(
            //               margin: EdgeInsets.all(6.0),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(0.0),
            //                 image: DecorationImage(
            //                   image: NetworkImage(k3),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //
            //             //5th Image of Slider
            //             Container(
            //               margin: EdgeInsets.all(6.0),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(0.0),
            //                 image: DecorationImage(
            //                   image: NetworkImage(k4),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //
            //           ],
            //
            //           //Slider Container properties
            //           options: CarouselOptions(
            //             height: 200,
            //             enlargeCenterPage: true,
            //             autoPlay: true,
            //             aspectRatio: 16 / 9,
            //             autoPlayCurve: Curves.fastOutSlowIn,
            //             enableInfiniteScroll: true,
            //             autoPlayAnimationDuration: Duration(milliseconds: 800),
            //             viewportFraction: 0.9,
            //           ),
            //         ),
            //
            //       ],
            //     )
            // ),
            Container(

              height: 220,
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('$url'),
                  fit: BoxFit.fitWidth,
                ),
              ),
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
                                child: Text('$Title',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                padding:EdgeInsets.all(10),
                              ),
                              Container(
                                  height: 40,
                                  padding:EdgeInsets.all(10),
                                  child: Text('$Address',style: TextStyle(fontSize: 15,color: Colors.grey),)
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
                                          CALL("tel:$Mobile");                                        },
                                          icon: Icon(Icons.phone),
                                          label: Text('Call'),style: ElevatedButton.styleFrom(primary:Colors.indigo),)
                                    ),
                                    Container(
                                        height: 50,
                                        alignment: Alignment.topRight,
                                        padding:EdgeInsets.all(10),
                                        child: ElevatedButton.icon(onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => bookgarage(Title:Title,),));
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
                              child: Text('Quick Services',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold)),
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
                              child: Text('$QuickServices',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
