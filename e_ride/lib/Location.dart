import 'package:flutter/material.dart';
import 'package:e_ride/UserChoice.dart';

class LocationAccess extends StatefulWidget {
  static const routeName = '/Location';

  @override
  _AcesssLocationState createState() => _AcesssLocationState();
}

class _AcesssLocationState extends State<LocationAccess> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: Stack(
        children: <Widget>[
          Container(decoration: BoxDecoration(color: Colors.white)),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 300,
                width: 300,
                color: Colors.grey[200],
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "\nAllow E-Ride to access this device’s "
                          "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tlocation?                        \n\n",
                          style: TextStyle(fontSize: 16),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/UserChoice');
                          },
                          child: ListTile(
                            title: Text(
                              'Allow All the time',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/UserChoice');
                          },
                          child: ListTile(
                            title: Text(
                              'Allow only while using this app',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                              'Deny',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
