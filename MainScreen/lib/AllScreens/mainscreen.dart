import 'dart:async';

import 'package:eride/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Position currentPosition;
  var geolocator = Geolocator();

  double bottomPaddingOfMap = 0;
  // late Marker _origin = 0 as Marker;
  // late Marker _destination = 0 as Marker;
  late GoogleMapController newMapController;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 14);
    newMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  // void _addMarker(LatLng pos) {
  //   // ignore: unnecessary_null_comparison
  //   if (_origin == null || (_origin == null && _destination == null)) {
  //     setState(() {
  //       _origin = Marker(
  //         markerId: const MarkerId('origin'),
  //         infoWindow: const InfoWindow(title: 'Origin'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //         position: pos,
  //       );
  //       // _destination = null;
  //     });
  //   } else {
  //     setState(() {
  //       _destination = Marker(
  //         markerId: const MarkerId('destination'),
  //         infoWindow: const InfoWindow(title: 'Destination'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //         position: pos,
  //       );
  //     });
  //   }
  // }
    // ignore: non_constant_identifier_names
    Completer<GoogleMapController> MapsController = Completer();

    // ignore: unused_field
    CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(37.773972, -122.431297),
      zoom: 14.4746,
    );

    @override
    // ignore: unused_element
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Find Ride '),
            backgroundColor: Colors.teal[200],
          ),
          body: Stack(children: [
            GoogleMap(
              padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: _initialCameraPosition,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                MapsController.complete(controller);
                newMapController = controller;

                setState(() {
                  bottomPaddingOfMap = 265.0;
                });
                locatePosition();
              },
              // markers: {
              //   // ignore: unnecessary_null_comparison
              //   if (_origin != null) _origin,
              //   // ignore: unnecessary_null_comparison
              //   if (_destination != null) _destination,
              // },
              // onLongPress: _addMarker,
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 16.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6.0),
                      Text("Hi, There !", style: TextStyle(fontSize: 16.0)),
                      Text("Where do you want to go?",
                          style: TextStyle(
                              fontSize: 22.0, fontFamily: "Brand Bold")),
                      SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 6.0,
                              spreadRadius: 0.5,
                              offset: Offset(0.7, 0.7),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 12.0,
                              ),
                              Icon(Icons.search, color: Colors.blueAccent),
                              Text("       Search Destination",
                                  style: TextStyle(
                                      fontSize: 18.0, fontFamily: "Brand Bold"))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        children: [
                          Icon(Icons.home),
                          SizedBox(
                            width: 12.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Home",
                                  style: TextStyle(fontFamily: "Brand Bold")),
                              SizedBox(height: 4.0),
                              Text("Your Home Address",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.0)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      DividerWidget(),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(
                            width: 12.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Work",
                                  style: TextStyle(fontFamily: "Brand Bold")),
                              SizedBox(height: 4.0),
                              Text("Your Office Address",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.0)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]));
    }
  }

 

  
