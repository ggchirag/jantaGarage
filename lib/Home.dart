import 'package:flutter/material.dart';
import 'package:jantagarage/Home_page.dart';
import 'package:jantagarage/main.dart';
import 'Home_page.dart';
import 'Search.dart';
import 'Towing.dart';
import 'Spareparts.dart';

import 'Login.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: ' ',),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  var title;

  MyNavigationBar ({super.key, required this.title});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _selectedIndex = 0;
  int _index = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Garage Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Spare Parts Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch(_index) {
      case 0:
        child = Search();
        break;

      case 1:
        child = FlutterLogo();
        break;
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text('Janta Garage'),
          backgroundColor: Colors.blueAccent
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                backgroundColor: Colors.blueAccent
            ),
            BottomNavigationBarItem(

                icon:Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.blueAccent
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.garage),
                label: 'Garage',
                backgroundColor: Colors.blueAccent
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.car_repair),
                label: 'Spareparts',
                backgroundColor: Colors.blueAccent
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:'Profile',
              //backgroundColor: Colors.redAccent,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          // currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }

}