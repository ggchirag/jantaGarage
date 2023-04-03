import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jantagarage/Navbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';



class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  String refer = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Offer%2Frefer.jpg?alt=media&token=733063da-8794-4939-adbb-2d9ca65131e8';
  String offer1 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Offer%2Foffer-1.png?alt=media&token=30649410-b5d8-4059-8bde-d2496e74c6fa';
  String offer4 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Offer%2Foffer-4.png?alt=media&token=5803667b-1470-4f44-911b-8daadbfb2caf';
  String offer5 = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Offer%2Foffer-5.png?alt=media&token=bfcaf116-58ed-4104-bb2b-c9a0de5f2c08';
  String krishna = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FKrishna%2Fkrishna.png?alt=media&token=99dee310-4958-4c83-ba98-21dccff31d48';
  String shiv = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FShiv%2Fshiv.png?alt=media&token=e704292c-6abb-4e3e-94a0-fc92cdf0f504';
  String vikram = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FVikram%2Fvikram.png?alt=media&token=8f230f26-d200-425c-b075-415c77d9c3b6';
  String  vk= 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FVk%2Fvk.png?alt=media&token=11f11322-5b4c-4f64-a1ee-5f0ba6446f59';
  String delux = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FDelux%2Fdelux.png?alt=media&token=eb797594-5227-4ff0-a099-09ff19ffa2ea';
  String motersclub = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FMotersClub%2Fmotersclub.jpg?alt=media&token=3ae0fad3-2991-4934-b307-99c47c260cc1';
  String royal = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FRoyal%2Froyal.png?alt=media&token=6f4ee71e-55e6-45c4-8ffc-bbddfc0d1a47';
  String shyam = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Garages%2FShyam%2Fshyam.png?alt=media&token=7cc17de1-9200-4209-a53b-346917850485';
  String city = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Towing%2Fcity.png?alt=media&token=7625bb24-5396-402f-8a34-816e74279f06';
  String dashmesh = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Towing%2Fdashmesh.png?alt=media&token=e50c97a1-13da-4edf-a2ea-379339b814f6';
  String maruti = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Towing%2Fmaruti.png?alt=media&token=16bc085d-ec05-4aad-8517-00181c8ebef2';
  String ankur = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Towing%2Fankur.png?alt=media&token=916581e2-dc9b-4ba6-aea7-f547c0007bbe';
  String balaji = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/Towing%2Fbalaji.png?alt=media&token=66ca31da-cd32-4379-b4f0-56b9ffb1b2e0';

  String hundai = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2FHyundai-logo.png?alt=media&token=38349bdd-1084-4121-aa91-db50e16e17d5';
  String  ms = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2FMS.png?alt=media&token=c5ba3ccc-3223-41d2-a206-3252dd16b512';
  String  tata = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2FTata-logo.png?alt=media&token=55907868-9b42-438f-90c8-c2dd264a2693';
  String  mahindra = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2Fmahindra.png?alt=media&token=ba888392-88a6-48ea-a3f8-49f798dcded3';
  String  toyota = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2Ftoyota.png?alt=media&token=508d86ae-86a2-4f65-8bf3-673be9bbed27';
  String  kia = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2Fkia.png?alt=media&token=ce82d7a5-d4b5-46c7-a2a5-4cda93d8ad0e';
  String  honda = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2Fhonda.png?alt=media&token=55163c15-51ba-46ea-8e15-86d999b911ca';
  String  citroen = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2Fcitroen.png?alt=media&token=53fee12c-d466-4fd0-9e16-9540cae3a37d';
  String  vw = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2Fwv.jpg?alt=media&token=7364d6cf-63ec-464a-a449-ab52fb3e5e91';
  String  skoda = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2Fskoda.png?alt=media&token=78a16460-2eb9-4b48-8d00-7a1e2f1988fe';
  String  renault = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2Frenault.jpg?alt=media&token=ed6565b4-a92d-4187-8487-8982ae10baf1';
  String  nissan = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/CarLogo%2Fnissan.jpg?alt=media&token=08e8ce66-1bdb-45e8-b94d-07b62b1ab2d3';


  double webProgress = 0;
bool loading = false;
  bool isLoading = true;
var margin = EdgeInsets.all(6.0);
var boxfit = BoxFit.fill;
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  @override
  void initState() {
    super.initState();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      print('source $_source');
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string =
          _source.values.toList()[0] ? 'Please Wait... ' : 'Mobile: Offline';
          break;
        case ConnectivityResult.wifi:
          string =
          _source.values.toList()[0] ? 'Please Wait... ' : 'Mobile: Offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'check your internet connection';
      }
      // 2.
      setState(() {});
      // 3.
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              height: 20.0,
              child: Text(
                string,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),

              ),
            ),
            duration: Duration(seconds: 5),
            backgroundColor: Colors.black,
          )
      );
    });
  }
  @override
  Future<void> setState(VoidCallback fn) async {
    super.setState(fn);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(string)));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Janta Garage'),
        ),

        drawer: NAvigationDrawer(),
        body: Column(
          children: [
            //       webProgress < 1  ? SizedBox(
            //   height: 5,
            //   child: Center(
            //     child: LinearProgressIndicator(),
            //   ),
            // ):
            SizedBox(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Offers', textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.indigo,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                      CarouselSlider(
                        items: [
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Container(
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                                image: DecorationImage(
                                  image: NetworkImage(offer1),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),

                          //2nd Image of Slider
                          Container(
                            padding: EdgeInsets.all(0),
                            margin: margin,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                              image: DecorationImage(
                                image: NetworkImage(offer5),
                                fit: boxfit,
                              ),
                            ),
                          ),


                          //4th Image of Slider
                          Container(
                            margin: margin,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                              image: DecorationImage(
                                image: NetworkImage(offer4),
                                fit: boxfit,
                              ),
                            ),
                          ),

                          //5th Image of Slider
                          Container(
                            margin: margin,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                              image: DecorationImage(
                                image: NetworkImage(offer5),
                                fit: boxfit,
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
                          autoPlayAnimationDuration: Duration(
                              milliseconds: 800),
                          viewportFraction: 0.9,
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(bottom: 10),
                      //   color: Colors.indigo,
                      //   child: Text('Top Cars'),
                      //   width: double.infinity,
                      //   height: 200,
                      // ),
                      SizedBox(height: 30,),
                      Text('Garages', style: TextStyle(color: Colors.indigo,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Stack(
                            children: [
                              CarouselSlider(
                                items: [
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(krishna),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //2nd Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(shiv),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //3rd Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(vikram),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //4th Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(vk),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //5th Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(delux),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //6th Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(motersclub),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //7th Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(royal),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //8th Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(shyam),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //9th Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(dashmesh),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //10th Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(ankur),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //11th Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(balaji),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //12th Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(maruti),
                                        fit: boxfit,
                                      ),
                                    ),
                                  ),

                                  //13th Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(city),
                                        fit: boxfit,
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
                                  autoPlayAnimationDuration: Duration(
                                      milliseconds: 800),
                                  viewportFraction: 0.9,
                                ),
                              )
                            ]

                        ),
                        width: double.infinity,
                        height: 200,
                      ), //garage name
                      SizedBox(height: 20,),
                      const Text('Top-Brands', style: TextStyle(color: Colors.indigo,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        color: Colors.white,
                        child: Stack(
                          children: <Widget>[
                            Positioned(top: 0,
                              left: 0,
                              width: 75,
                              height: 75,
                              child: InkWell(onTap: () {
                                launch('https://www.marutisuzuki.com/');
                              }, child: Image(image: NetworkImage(ms),)),),
                            //SizedBox(height: 10,),
                            Positioned(top: 0,
                              left: 100,
                              width: 75,
                              height: 75,
                              child: InkWell(onTap: () {
                                launch('https://www.hyundai.com/in/en');
                              }, child: Image(image: NetworkImage(hundai),)),
                            ),
                            Positioned(top: 0,
                              left: 200,
                              width: 75,
                              height: 75,
                              child: InkWell(onTap: () {
                                launch('https://www.tatamotors.com/');
                              }, child: Image(image: NetworkImage(tata),)),),

                            Positioned(top: 0,
                              left: 300,
                              width: 75,
                              height: 75,
                              child: InkWell(onTap: () {
                                launch(
                                    'https://www.m2all.com/?gclid=Cj0KCQjw2cWgBhDYARIsALggUhqyPqSyDZ_nIn-lc0PxDCBQ1uCm23MeZ8nnewBJCebERVsmbRMKO1caAgeHEALw_wcB');
                              }, child: Image(image: NetworkImage(mahindra),)),
                            ),
                            Positioned(bottom: 60,
                              left: 0,
                              width: 70,
                              height: 70,
                              child: InkWell(onTap: () {
                                launch('https://www.toyotabharat.com/');
                              }, child: Image(image: NetworkImage(toyota),)),),
                            Positioned(bottom: 60,
                              left: 100,
                              width: 75,
                              height: 75,
                              child: InkWell(onTap: () {
                                launch('https://www.kia.com/in/home.html');
                              }, child: Image(image: NetworkImage(kia),)),),
                            Positioned(bottom: 60,
                              left: 200,
                              width: 75,
                              height: 75,
                              child: InkWell(onTap: () {
                                launch('https://www.hondacarindia.com/');
                              }, child: Image(image: NetworkImage(honda),)),),
                            Positioned(bottom: 60,
                              left: 300,
                              width: 75,
                              height: 75,
                              child: InkWell(onTap: () {
                                launch('https://www.citroen.in/');
                              }, child: Image(image: NetworkImage(citroen),)),),
                            Positioned(bottom: 0,
                              left: 0,
                              width: 75,
                              height: 75,
                              child: InkWell(onTap: () {
                                launch('https://www.volkswagen.co.in/en.html');
                              }, child: Image(image: NetworkImage(vw),)),),
                            Positioned(bottom: 0,
                              left: 100,
                              width: 75,
                              height: 75,
                              child: InkWell(onTap: () {
                                launch('https://www.skoda-auto.co.in/');
                              }, child: Image(image: NetworkImage(skoda),)),),
                            Positioned(bottom: 0,
                              left: 200,
                              width: 65,
                              height: 65,
                              child: InkWell(onTap: () {
                                launch('https://www.renault.co.in/');
                              }, child: Image(image: NetworkImage(renault),)),),
                            Positioned(bottom: 0,
                              left: 300,
                              width: 65,
                              height: 65,
                              child: InkWell(onTap: () {
                                launch('https://www.nissan.in/');
                              }, child: Image(image: NetworkImage(nissan),)),
                            ),

                          ],

                        ),
                        width: double.infinity,
                        height: 200,
                      ), //car logo
                      SizedBox(height: 30,),
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(refer),
                            )
                        ),
                      ),


                    ],

                  ),
                ),
              ),
            ),
          ],
        )
    );
  }@override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }
}
class NetworkConnectivity {
  NetworkConnectivity._();
  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;
  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      print(result);
      _checkStatus(result);
    });
  }
  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }
  void disposeStream() => _controller.close();
}



