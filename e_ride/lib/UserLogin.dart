import 'package:e_ride/PhoneVerification.dart';
import 'package:flutter/material.dart';

class UserLoginScreen extends StatefulWidget {
  static const routeName = '/UserLogin';

  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final myController = TextEditingController(); //Full Name
  final myController1 = TextEditingController(); //Mobile Number

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.teal[200],
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text('User Login',
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: myController,
                        decoration: InputDecoration(
                            labelText: 'Full Name:',
                            prefixIcon: Icon(Icons.person),
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.white54),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: myController1,
                        decoration: InputDecoration(
                            labelText: 'Mobile Number:',
                            prefixIcon: Icon(Icons.phone_android),
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.white54),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.green,
                          child: InkWell(
                            onTap: () {
                              if (myController.text != '' &&
                                  myController1.text != '') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PhoneVerificationScreen()),
                                );
                              } else {
                                final _logInErrorBar = SnackBar(
                                  content: Text(
                                    "Full Name or Mobile Number can't be empty!",
                                    style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 17,
                                      fontFamily: 'OpenSans',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: const Duration(milliseconds: 3000),
                                  backgroundColor: Colors.red.shade400,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(_logInErrorBar);
                              }
                            },
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "By tapping login you agree to terms and conditions and privacy \n \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tpolicy of e-ride",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                        color: Colors.black26),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
