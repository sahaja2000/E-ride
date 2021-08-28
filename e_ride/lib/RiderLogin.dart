import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_ride/HomePage.dart';
import 'package:e_ride/Profile.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class RiderLoginScreen extends StatefulWidget {
  static const routeName = '/RiderLogin';

  @override
  _RiderLoginScreenState createState() => _RiderLoginScreenState();
}

class _RiderLoginScreenState extends State<RiderLoginScreen> {
  final myController = TextEditingController(); //email
  final myController1 = TextEditingController(); //password
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();
  Future<User> _signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
    ));
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    User userDetails =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.uid);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.uid,
      userDetails.displayName,
      userDetails.photoURL,
      userDetails.email,
      providerData,
    );
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new ProfilePage(detailsUser: details),
      ),
    );
    return userDetails;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    super.dispose();
  }

  bool isHiddenPassword = true;
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
                      child: Text('Rider Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold)),
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
                            labelText: 'Mobile Number:',
                            prefixIcon: Icon(Icons.phone_android),
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.white54),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        obscureText: isHiddenPassword,
                        controller: myController1,
                        decoration: InputDecoration(
                            labelText: 'Password:',
                            prefixIcon: Icon(Icons.security),
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                              ),
                            ),
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.white54),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        // validator:
                        child: InkWell(
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                        ),
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
                                      builder: (context) => Homepage()),
                                );
                              } else {
                                final _logInErrorBar = SnackBar(
                                  content: Text(
                                    "Mobile Number or Password can't be empty!",
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
                      SizedBox(height: 20.0),
                      // SizedBox(height: 10.0),
                      Container(
                          height: 40.0,
                          child: Align(
                            alignment: Alignment.center,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(20.0)),
                              color: Color(0xffffffff),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Image(
                                        image: AssetImage(
                                            'assets/image/google-logo.png')),
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    'Continue with google',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18.0),
                                  ),
                                ],
                              ),
                              onPressed: () => _signIn(context)
                                  .then((User user) => print(user))
                                  .catchError((e) => print(e)),
                            ),
                          )),
                    ],
                  )),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontFamily: 'Montserrat', color: Colors.white),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/RiderRegister');
                    },
                    child: Text(
                      'Register',
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
          ),
        ));
  }

  void _togglePasswordView() {
    // if (isHiddenPassword == true) {
    //   isHiddenPassword = false;
    // } else {
    //   isHiddenPassword = true;
    // }
    // isHiddenPassword = !isHiddenPassword;
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
