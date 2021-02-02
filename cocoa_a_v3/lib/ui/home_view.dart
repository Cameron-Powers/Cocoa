import 'dart:collection';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hexcolor/hexcolor.dart';
import 'register_business.dart';

import 'package:cocoa_a_v3/net/api_methods.dart';
import 'add_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoa_a_v3/ui/add_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;
  static final CameraPosition _ottawa = CameraPosition(
    target: LatLng(45.4215, -75.6972),
    zoom: 13,
  );

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/logo3.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(45.4215, -75.6972),
          infoWindow: InfoWindow(
            title: "Ottawa",
            snippet: "test",
          ),
          // icon: _markerIcon,
        ),
      );
    });
  }

  Future<void> _backToOttawa() async {
    _mapController.animateCamera(CameraUpdate.newCameraPosition(_ottawa));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo2.png', height: 70),
        backgroundColor: HexColor('#8547FF'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/logo1.png', height: 70),
              decoration: BoxDecoration(
                color: HexColor('#8547FF'),
              ),
            ),
            ListTile(
                title: Text('Add Business'),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterBusiness()));
                }),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Update the state of the app
                Navigator.pop(context);
              },
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(0, 500, 0, 32),
              child: Text("Developed by Cameron Powers"),
            )
          ],
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _ottawa,
        onMapCreated: _onMapCreated,
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _backToOttawa,
        label: Text('Ottawa'),
        icon: Icon(Icons.home),
        backgroundColor: HexColor('#8547FF'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

// class _HomeViewState extends State<HomeView> {
//   double bitcoin = 0.0;
//   double ethereum = 0.0;
//   double tether = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//           ),
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Center(
//             child: StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('Users')
//                     .doc(FirebaseAuth.instance.currentUser.uid)
//                     .collection('Coins')
//                     .snapshots(),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   return ListView(
//                     children: snapshot.data.docs.map((document) {
//                       return Container(
//                           child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text('User Name: ${document.id}'),
//                           Text('Amount Owned: \$${getValue(document.id, document.data()['Amount']).toStringAsFixed(2)}'),
//                         ],
//                       ));
//                     }).toList(),
//                   );
//                 }),
//           )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddView()),
//           );
//         },
//         child: Icon(Icons.add, color: Colors.white),
//         backgroundColor: Colors.blue,
//       ),
//     );
//   }
// }
