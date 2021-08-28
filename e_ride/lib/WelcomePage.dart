import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:e_ride/RiderLogin.dart';
import 'package:e_ride/RiderRegister.dart';

class Welcomescreen extends StatelessWidget {
  static const routeName = '/WelcomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.teal[200],
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sasto ani bharpardo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image/logo.PNG"))),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.green,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RiderLoginScreen()));
                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.green,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RiderRegisterScreen()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
