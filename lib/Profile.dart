import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jantagarage/Home_page.dart';
import 'package:jantagarage/Login.dart';
import 'package:jantagarage/Regestration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

late String finalname = "";
late String finalmobile = "";
late String finalemail = "";
late String finalpincode = "";
late String finaladdress = "";


class profile extends StatefulWidget{
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  late SharedPreferences sharedPreferences;
  String person = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Windows_10_Default_Profile_Picture.svg/768px-Windows_10_Default_Profile_Picture.svg.png';
  bool isObscurePassword = true;
  late PickedFile _imageFile = new PickedFile("");
  final ImagePicker _picker  = ImagePicker();
  late DatabaseReference dbRef;
  // Query dbRef = FirebaseDatabase.instance.ref().child('user');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('user');
  late String obtainedname;
  late String obtainedmobile;
  late String obtainedemail;
  late String obtainedpincode;
  late String obtaineaddress;

  var namecontroller = new TextEditingController();
  var addresscontroller = new TextEditingController();
  var emailcontroller = new TextEditingController();
  var pincodeconntrller = new TextEditingController();

  bool _validate = false;
  late DatabaseReference dbref;
  String imgpath = '';

  late String url;

  Future<String> uploadImage() async {
    final path = 'profile/${obtainedmobile.toString()}';
    final ref = FirebaseStorage.instance.ref().child(path);
    // ref.putFile(new File(_imageFile.path));
    // Reference ref = FirebaseStorage.instance.ref().child('default.png');
    UploadTask uploadTask = ref.putFile(new File(_imageFile.path));
    final snapshot = await uploadTask.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    Map<String, String> user = {
      'name': obtainedname.toString(),
      'mobile': obtainedmobile.toString(),
      'services': obtainedemail.toString(),
      'pincode': obtainedpincode.toString(),
      'address': obtaineaddress.toString(),
      'url': urlDownload,
    };
    dbref.push().set(user);
    url = urlDownload;
    print("The url is here! $urlDownload");
    return urlDownload;
  }

  @override
  void initState() {
    getValidationData();
    print(_imageFile.path);
    dbRef = FirebaseDatabase.instance.ref().child('user');
    super.initState();
  }
  Future getValidationData() async{
    sharedPreferences = await SharedPreferences.getInstance();



    setState(() {
       obtainedname = sharedPreferences.getString('name')!;
       obtaineaddress = sharedPreferences.getString('address')!;
       obtainedmobile = sharedPreferences.getString('mobile')!;
       obtainedemail = sharedPreferences.getString('email')!;
       obtainedpincode = sharedPreferences.getString('pincode')!;
      /*sharedPreferences.getString('name') == null ? finalname = "":finalname = obtainedname!;
      sharedPreferences.getString('mobile') == null ? finalmobile = "":finalmobile = obtainedmobile!;
      sharedPreferences.getString('email') == null ? finalemail = "":finalemail = obtainedemail!;
      sharedPreferences.getString('pincode') ==null ? finalpincode = "":finalpincode = obtainedpincode!;
      sharedPreferences.getString('address') == null ? finaladdress = "":finaladdress = obtainedaddress!;*/
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home(),));
            },
          ),
          title: Text('Profile'),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15,top: 10,right: 15),
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                imageProfile(),
                SizedBox(height: 30,),
                buildTextFormField("FullName",obtainedname ,false,namecontroller),
                buildTextFormField("Email",obtainedemail,false,emailcontroller),
                buildTextFormField("Pincode",obtainedpincode ,false,pincodeconntrller),
                buildTextFormField("Address",obtaineaddress,false,addresscontroller),

                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20,top: 70),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: (){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                          },
                          child: Text('LogOut'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20,top: 70),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: (){
                            if(!namecontroller.text.isEmpty){
                              obtainedname = namecontroller.text;
                              sharedPreferences.setString("name", obtainedname);
                            }
                            else if(!emailcontroller.text.isEmpty){
                              obtainedemail = emailcontroller.text;
                              sharedPreferences.setString("email", obtainedname);
                            }
                            else if(!addresscontroller.text.isEmpty){
                              obtaineaddress = addresscontroller.text;
                              sharedPreferences.setString("address", obtainedname);
                            }
                            else if(!pincodeconntrller.text.isEmpty){
                              obtainedpincode = pincodeconntrller.text;
                              sharedPreferences.setString("pincode", obtainedname);
                            }
                            if(!_validate)
                            {

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
                            }
                            if(obtainedname.toString().isNotEmpty && obtaineaddress.toString().isNotEmpty && obtainedmobile.toString().isNotEmpty && obtainedemail.toString().isNotEmpty && obtainedpincode.toString().isNotEmpty){
                              insertData(obtainedname.toString(), obtaineaddress.toString(), obtainedmobile.toString(), obtainedemail.toString(), obtainedpincode.toString(), );

                            }

                            uploadImage();
                          },
                          child: Text('Edit'),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                          ),),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
  void insertData(String name,String add,String mob,String email,String pin,){
    dbRef.child(mob).set({
      'name' : name,
      'address' : add,
      'mobile' : mob,
      'email' : email,
      'pincode' : pin,
      'url' : url,

    });
    /*obtainedname = "" ;
    obtainedmobile = "" ;
    obtainedemail = "";
    obtaineaddress = "" ;
    obtainedpincode = "";*/

  }
  Widget buildTextFormField(String labelText , String placeholder , bool isPasswordTextField,TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ?
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye, color: Colors.grey,)) : null,
            contentPadding: EdgeInsets.only(bottom: 5),
             labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,

            hintText: '$placeholder',
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )

        ),
      ),
    );
  }

  Widget imageProfile(){
    return Center(
      child: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: 70,
              backgroundImage:  _imageFile.path == "" ? NetworkImage(person) : FileImage(
                      File(_imageFile.path)) as ImageProvider,
              // child: Image(
              //     fit: BoxFit.cover,
              //     image: _imageFile.path == "" ? NetworkImage(person) : FileImage(
              //         File(_imageFile.path)) as ImageProvider
              //
              //
              // ),
              // backgroundImage: _imageFile.path == "" ? NetworkImage(person):FileImage(File(_imageFile.path)) as ImageProvider,
            ),
            Positioned(
              right: 20.0,
              bottom: 20.0,
              child: InkWell(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    builder:(context) => bottomsheet(),);
                },
                child: Icon(Icons.camera_alt,
                  color: Colors.indigo,
                  size: 28.0,),
              ),
            )

          ]),
    );
  }
  void takePhoto(ImageSource source) async{
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }
  Widget bottomsheet(){
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(children: <Widget>[
          Text('Choose Profile Photo', style: TextStyle(fontSize: 20.0),),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(onPressed:(){
                takePhoto(ImageSource.camera);
              }, icon: Icon(Icons.camera), label: Text('Camera')),
              TextButton.icon(onPressed:(){
                takePhoto(ImageSource.gallery);
              }, icon: Icon(Icons.image), label: Text('Gallery')),
            ],)
        ],)
    );
  }
}
