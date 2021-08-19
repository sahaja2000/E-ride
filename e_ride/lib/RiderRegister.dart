import 'package:flutter/material.dart';
import 'package:e_ride/RiderLogin.dart';

class RiderRegisterScreen extends StatefulWidget {
  static const routeName = '/RiderRegister';
  @override
  _RiderRegisterScreenState createState() => _RiderRegisterScreenState();
}

class _RiderRegisterScreenState extends State<RiderRegisterScreen> {
  final myController = TextEditingController(); //email
  final myController1 = TextEditingController();
  final myController2 = TextEditingController(); //password
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.teal[200],
        resizeToAvoidBottomInset: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Rider Register',
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                    )
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
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.white54),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: myController1,
                        decoration: InputDecoration(
                            labelText: 'Mobile Number:',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.white54),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: myController2,
                        decoration: InputDecoration(
                            labelText: 'Password:',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.white54),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 50.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            // shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () {
                                if (myController.text != '' &&
                                    myController1.text != '' &&
                                    myController2.text != '') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RiderLoginScreen()),
                                  );
                                } else {
                                  final _logInErrorBar = SnackBar(
                                    content: Text(
                                      "Username or Password or number can't be empty!",
                                      style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 17,
                                        fontFamily: 'OpenSans',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    duration:
                                        const Duration(milliseconds: 3000),
                                    backgroundColor: Colors.red.shade400,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(_logInErrorBar);
                                }
                              },
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account",
                            style: TextStyle(
                                fontFamily: 'Montserrat', color: Colors.white),
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/RiderLogin');
                            },
                            child: Text(
                              'login',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ]));
  }
}
