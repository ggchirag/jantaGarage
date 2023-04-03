import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Garages.dart';
import 'Spareparts.dart';

class Towing extends StatefulWidget {
  const Towing({Key? key}) : super(key: key);

  @override
  State<Towing> createState() => _TowingState();
}

class _TowingState extends State<Towing> {
  Query dbRef = FirebaseDatabase.instance.ref().child('towing');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('towing');

  Widget listItem({required Map towing}) {
    return Container(
      margin: const EdgeInsets.all(10),
      // padding: const EdgeInsets.all(10),
      height: 294,
      // color: Colors.indigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: Container(

              // padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(

                color: Colors.indigo,
                borderRadius: BorderRadius.circular(12),

              ),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                        image: DecorationImage(
                            image: NetworkImage(
                              // 'assets/images/vikram.png'
                                towing['url']
                            ),fit: BoxFit.cover
                        )
                    ),

                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,top: 16,bottom: 16,right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(towing['name']!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white
                                ),
                                child: Center(child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(onTap: () {

                                    },
                                        child: Icon(Icons.phone)),
                                    SizedBox(width: 5,),
                                    InkWell(onTap: () {
                                      CALL(towing['mobile']);
                                      launch('tel:$towing[\'mobile\']');
                                    },
                                        child: Text("Call")),
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(width: 16,),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => garages(text : ),));
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => garages(Title: towing['name']??"",Address: towing['address']??"",QuickServices: towing['services']??"",Mobile: towing['mobile'],url: towing['url']??"")));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white
                                  ),
                                  child: Center(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.info),
                                      SizedBox(width: 5,),
                                      Text("Enquiery"),
                                    ],
                                  )),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Towing'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map User = snapshot.value as Map;
              User['key'] = snapshot.key;

              return listItem(towing: User);
            },

          ),
        )

    );
  }
}
