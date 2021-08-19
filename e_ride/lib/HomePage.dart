import 'dart:ui';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/HomePage';
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('E-Ride'),
        elevation: 0.1,
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(
                'Sahaja Phuyal\n9841478596',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text('Sahajaphuyal1@gmail.com',
                  style: TextStyle(color: Colors.white)),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Image.asset('assets/image/Sahaja.jpg'),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.teal[200]),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/Profile');
              },
              child: ListTile(
                title: Text('View profile details'),
                leading: Icon(Icons.person),
                tileColor: Colors.white,
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/RiderLogin');
              },
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                tileColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
