import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jantagarage/payment.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'bookedscreen.dart';

class bookgarage extends StatefulWidget {
  static String tag='book';
  String? Title;

  bookgarage({Key? key,required this.Title,}) : super(key: key);


  @override
  State<bookgarage> createState() => _bookgarageState(Title: Title);
}

class _bookgarageState extends State<bookgarage> {
  _bookgarageState({Key? key,required this.Title,});
  final _formKey = GlobalKey<FormState>();
  late String _selectedValue;
  //final List<String> _listNames = ['MarutiSuzuki','Hundai','Tata','Mahindra','Toyota','Kia','Honda','Citroen','VolksVegan','Skoda','Renault','Nissan'];
  late String _name;
  late String _vname;
  late String _vinfo;
  late String _mobileno;
  late String _description;
  late String _address;
  var datePicked;
  String date = "Select Date";
  String time = "Select Time";
  String? Title ;
  late DatabaseReference dbRef;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('book');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Book Your Appointment'),
        ),
        body:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                        suffixIcon: Icon(Icons.person),
                        labelText: 'User Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                        suffixIcon: Icon(Icons.car_repair_outlined),
                        labelText: 'Vehicle Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your vehicle Name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _vname = value!;
                      },
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                        suffixIcon: Icon(Icons.car_repair),
                        labelText: 'Vehicle Info',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a vehicle Info';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _vinfo = value!;
                      },
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                        suffixIcon: Icon(Icons.call),
                        labelText: 'Mobile No',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Mobile no';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _mobileno = value!;
                      },
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                        suffixIcon: Icon(Icons.home),
                        labelText: 'Enter Pick-up Point',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Pick-up Point';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _address = value!;
                      },
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(21)),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: ()async {
                              DateTime? datePicked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2024)
                              );
                              if(datePicked!=null){
                                print('Date Picked ${datePicked.day}-${datePicked.month}-${datePicked.year}');
                                setState(() {
                                  date = '${datePicked.day}-${datePicked.month}-${datePicked.year}';
                                });
                              }
                            }, child: Text(date)),
                            SizedBox(width: 80,),
                            ElevatedButton(onPressed: () async {
                              TimeOfDay? pickedTime =await  showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour:0, minute:0));
                              if(pickedTime!=null){
                                setState(() {
                                  time = '${pickedTime.hour}:${pickedTime.minute}';
                                });
                              }
                            }, child: Text(time))
                          ],
                        ),
                      ),
                    ) ,


                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                        suffixIcon: Icon(Icons.description),
                        labelText: 'Description',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _description = value!;

                      },
                    ),
                    SizedBox(height: 20,),

                    SizedBox(height: 16.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Do something with the form data
                          }
                          Map<String,String> book = {
                            'username' : _name.toString(),
                            'vehicle name' : _vname.toString(),
                            'vehicle info': _vinfo.toString(),
                            'mobile': _mobileno.toString(),
                            'pick-up' :_address.toString(),
                            'description' : _description.toString(),
                            'date': date.toString(),
                            'time' :time.toString(),
                            'Garage' :Title.toString(),
                          };
                          dbRef.push().set(book);
                           Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
                          Razorpay _razorpay = Razorpay();
                          var options = {
                            'key': '<YOUR_KEY_HERE>',
                            'amount': 100,
                            'name': 'Acme Corp.',
                            'description': 'Fine T-Shirt',
                            'prefill': {
                              'contact': '8888888888',
                              'email': 'test@razorpay.com'
                            }
                          };
                          _razorpay.open(options);
                          _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
                          _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
                          _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
                        },
                        style: ButtonStyle(alignment: Alignment.center),
                        child: Text('Book'),
                      ),
                    ),
                  ],

                ),
              ),
            ),
          ),
        ),

    );
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => booked(title: '',),));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

}
