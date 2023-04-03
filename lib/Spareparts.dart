import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jantagarage/Home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Spareparts extends StatefulWidget{
  @override
  State<Spareparts> createState() => _SparepartsState();
}

Future<void> CALL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "cannot launch $url";
  }
}

_launchURL()async{
  const url = 'https://gomechanic.in/surat';
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw "Can not launch $url";
  }
}

launchurl() async {
  const url = 'https://www.flipkart.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "cannot launch $url";
  }
}
class _SparepartsState extends State<Spareparts> {
  bool buttonenabled = true;
  bool isLoading = false;
  List<String> imageUrls = [
    'https://play-lh.googleusercontent.com/q8hxnbpJCYfHipSOG_5tZe5jK_89T6QIsqrEklvGpMFKH8b98pDHJf2tPcn2bxEN96ON',
    'https://play-lh.googleusercontent.com/iiocq2b-uHR8JLmkpMX2Sx_fqszXpQe_Jzv9DdGRcfKXCWIJLMdaDKZA2Vi5-4FW2g',
    'https://i.pinimg.com/originals/01/ca/da/01cada77a0a7d326d85b7969fe26a728.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Gomechanic.png/800px-Gomechanic.png',
    'https://www.tata.com/content/dam/tata/images/home-page/desktop/logo_card_desktop_362x362.jpg',
    'https://cdni.autocarindia.com/ExtraImages/20210809125610_Mahindra_Logo_1.jpg',
    'https://newsonprojects.com/uploads/news/105319.jpg',
    'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/41Vb8kVGvJL._SX355_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXKxaXJWGaqWaZTf1x2QfUZtQkcrmXOMNyaf-xUbP9&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqWrgIU3xLFUyXU-HRoO3kCKjjfRjNvT5rRQ&usqp=CAU',
    'https://image.shutterstock.com/image-photo/image-260nw-284535017.jpg',




   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spare Parts'),
      ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: imageUrls.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if(index == 0 ){
                launch('https://www.flipkart.com/search?q=spareparts&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off');
              };
              if(index == 1 ){
                launch('https://boodmo.com/');
              };
              if(index == 2 ){
                launch('https://www.amazon.in/s?k=spare+parts+for+car&crid=2QKV91KKLAE6P&sprefix=spare+parts+for+car%2Caps%2C373&ref=nb_sb_noss_2');
              };
              if(index == 3 ){
                launch('https://gomechanic.in/spares/');
              };
              if(index == 4 ){
                launch('https://www.tatamotors.com/');
              };
              if(index == 5 ){
                launch('https://www.m2all.com/?gclid=Cj0KCQjw2cWgBhDYARIsALggUhqyPqSyDZ_nIn-lc0PxDCBQ1uCm23MeZ8nnewBJCebERVsmbRMKO1caAgeHEALw_wcB');
              };
              if(index == 6 ){
                launch('https://www.marutisuzuki.com/genuine-parts');
              };
              if(index == 7 ){
                launch('https://www.hyundai.com/in/en');
              };
              if(index == 8 ){
                launch('https://www.toyotapartsconnect.in/');
              };
              if(index == 9 ){
                launch('https://www.kia.com/in/home.html');
              };
              if(index == 10 ){
                launch('https://www.hondacarindia.com/');
              };
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid,color: Colors.indigo,width: 3),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),topRight: Radius.circular(10,))
              ),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    ),
    //   body:Center(
    //     child: Column(
    //       children: [
    //         ElevatedButton(onPressed:(){
    //           launch('https://gomechanic.in/spares/');
    //         },
    //     child: Text('Go Mechanic')),
    //
    //         ElevatedButton(onPressed: (){
    //           launch('https://www.amazon.in/s?k=Spareparts&crid=2JOC2EEGQ3I5Z&sprefix=sparepart%2Caps%2C458&ref=nb_sb_noss_2');
    //         }, child: Text('Amazon')),
    //         ElevatedButton(onPressed: (){
    //           launch('https://www.flipkart.com/search?q=spareparts&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off');
    //         }, child: Text('Flipcart')),
    //
    //         ElevatedButton(onPressed: ()async{
    //           if(isLoading) return ;
    //           setState(() => isLoading = true);
    //           await Future.delayed(Duration(seconds: 2));
    //           setState(() => isLoading = false);
    //         }, child: isLoading ?   CircularProgressIndicator(color: Colors.white,) : Text('Loding')),
    // ],
    //   ),
    //   )
    );
  }
}