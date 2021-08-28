import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_ride/SplashScreen.dart';
import 'package:e_ride/Location.dart';
import 'package:e_ride/UserChoice.dart';
import 'package:e_ride/WelcomePage.dart';
import 'package:e_ride/RiderLogin.dart';
import 'package:e_ride/RiderRegister.dart';
import 'package:e_ride/UserLogin.dart';
import 'package:e_ride/PhoneVerification.dart';
import 'package:e_ride/HomePage.dart';
import 'package:e_ride/Profile.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Splash(),
      routes: {
        RiderRegisterScreen.routeName: (ctx) => RiderRegisterScreen(),
        Userchoice.routeName: (ctx) => Userchoice(),
        LocationAccess.routeName: (ctx) => LocationAccess(),
        Welcomescreen.routeName: (ctx) => Welcomescreen(),
        Splash.routeName: (ctx) => Splash(),
        RiderLoginScreen.routeName: (ctx) => RiderLoginScreen(),
        UserLoginScreen.routeName: (ctx) => UserLoginScreen(),
        PhoneVerificationScreen.routeName: (ctx) => PhoneVerificationScreen(),
        Homepage.routeName: (ctx) => Homepage(),
        // ProfilePage.routeName: (ctx) => ProfilePage(),
      },
    );
  }
}
