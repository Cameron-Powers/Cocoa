import 'package:cocoa_a_v3/net/api_methods.dart';
import 'add_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoa_a_v3/ui/add_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double bitcoin = 0.0;
  double ethereum = 0.0;
  double tether = 0.0;

  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Home'),
      // body: Container(
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //     ),
      //     width: MediaQuery.of(context).size.width,
      //     height: MediaQuery.of(context).size.height,
      //     child: Center(
      //       child: StreamBuilder(
      //           stream: FirebaseFirestore.instance
      //               .collection('Users')
      //               .doc(FirebaseAuth.instance.currentUser.uid)
      //               .collection('Coins')
      //               .snapshots(),
      //           builder: (BuildContext context,
      //               AsyncSnapshot<QuerySnapshot> snapshot) {
      //             if (!snapshot.hasData) {
      //               return Center(
      //                 child: CircularProgressIndicator(),
      //               );
      //             }
      //             return ListView(
      //               children: snapshot.data.docs.map((document) {
      //                 return Container(
      //                     child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     Text('User Name: ${document.id}'),
      //                     Text('Amount Owned: \$${getValue(document.id, document.data()['Amount']).toStringAsFixed(2)}'),
      //                   ],
      //                 ));
      //               }).toList(),
      //             );
      //           }),
      //     )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => AddView()),
      //     );
      //   },
      //   child: Icon(Icons.add, color: Colors.white),
      //   backgroundColor: Colors.blue,
      // ),
      
    );
  }
}
