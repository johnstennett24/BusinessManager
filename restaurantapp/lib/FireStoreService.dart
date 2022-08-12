import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//class FireStoreService {
//  final db = FirebaseFirestore.instance
//      .collection('store1')
//      .doc('CI4bM8dwoLr3PUVZLnUn')
//      .snapshots();
//
//  Stream<double> getRevenue() async* {
//    StreamBuilder(
//      stream: db,
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return const Text('Loading...');
//        } else {
//          var document = snapshot.data as DocumentSnapshot;
//          return Text(document['revenue']);
//        }
//      },
//    );
//  }
//}
