import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jantagarage/Home_page.dart';
import 'package:jantagarage/Login.dart';
import 'package:jantagarage/Search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Profile.dart';
import 'Spareparts.dart';
import 'Towing.dart';


late String finalname;
late String finalemail;
class NAvigationDrawer extends StatefulWidget {
  const NAvigationDrawer({Key? key}) : super(key: key);


  @override
  State<NAvigationDrawer> createState() => _NAvigationDrawerState();
}

class _NAvigationDrawerState extends State<NAvigationDrawer> {

  var iconarrow = Icon(Icons.arrow_forward_ios,color: Colors.indigo);
  var icon = Icons.arrow_forward_ios;
  late String obtainedname;
  late String obtainedemail;
  TextEditingController phoneController = TextEditingController();
  TextEditingController fnmcontroller = TextEditingController();
  String harsh = 'https://firebasestorage.googleapis.com/v0/b/authntication-f92cd.appspot.com/o/harsh.jpg?alt=media&token=8718dc16-2108-43b1-86b2-52d429c626e9';
  String person = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Windows_10_Default_Profile_Picture.svg/768px-Windows_10_Default_Profile_Picture.svg.png';

  @override
  void initState() {
    getValidationData();
    super.initState();
  }
  Future getValidationData() async{
    final SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
    var obtainedname = sharedPreferences.getString('name');
    var obtainedaddress = sharedPreferences.getString('address');
    var obtainedmobile = sharedPreferences.getString('mobile');
    var obtainedemail = sharedPreferences.getString('email');
    var obtainedpincode = sharedPreferences.getString('pincode');

    setState(() {
      sharedPreferences.getString('name') == null ? finalname = "":finalname = obtainedname!;
      sharedPreferences.getString('email') == null ? finalemail = "":finalemail = obtainedemail!;
    });
  }



  @override
  Widget build(BuildContext context) {
    return   Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,

              children: [

                UserAccountsDrawerHeader(
                  //accountName: Text(fnmcontroller.text,style: TextStyle(color: Colors.red),),
                  accountName: Text('$finalname',style: TextStyle(color: Colors.white),),
                  accountEmail: Text('$finalemail',style: TextStyle(color: Colors.white),),

                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child:InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => profile(),));
                        },
                        child: Image(image: NetworkImage(person),
                          fit:BoxFit.cover,
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
                    ),
                  ),
                ),
                ListTile(
                    leading:Icon(Icons.person,color: Colors.indigo) ,
                    trailing: iconarrow,
                    title: Text('Profile',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.indigo),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => profile(),));
                    }
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 10,
                  endIndent: 20,
                  color: Colors.indigo,
                ),
                ListTile(
                    leading: Icon(Icons.home,color: Colors.indigo),
                    trailing:iconarrow,
                    title: Text('Home',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.indigo),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => Home(),));
                    }
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 10,
                  endIndent: 20,
                  color: Colors.indigo,
                ),
                ListTile(
                  leading: Icon(Icons.garage_rounded,color: Colors.indigo),
                  trailing: iconarrow,
                  title: Text('Garages',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.indigo),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),));
                  },
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 10,
                  endIndent: 20,
                  color: Colors.indigo,
                ),
                ListTile(
                  leading: Icon(Icons.car_crash,color: Colors.indigo),
                  trailing: iconarrow,
                  title: Text('Spareparts',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.indigo),),
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Spareparts(),));
                  },
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 10,
                  endIndent: 20,
                  color: Colors.indigo,
                ),
                ListTile(
                  leading: Icon(Icons.car_repair_rounded,color: Colors.indigo),
                  trailing: iconarrow,
                  title: Text('Towing',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.indigo),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Towing(),));
                  },
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 10,
                  endIndent: 20,
                  color: Colors.indigo,
                ),
                SizedBox(height: 270,),
                Spacer(),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 10,
                  endIndent: 20,
                  color: Colors.indigo,
                ),
                ListTile(
                 // trailing: iconarrow,
                  title: Text('LogOut',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.indigo),),
                  onTap: () async{
                    final SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
                    sharedPreferences.remove('name');
                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                ),
              ],
            ),


          ),

        ],
      );

  }
}
