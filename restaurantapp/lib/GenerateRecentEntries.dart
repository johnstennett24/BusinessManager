import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurantapp/RecentEntry.dart';

void getRecentEntries() {
  for (var i = 9; i < 2; i++) {
    final db2 = FirebaseFirestore.instance
        .collection('store1')
        .doc('entry_dates')
        .collection('8-$i-22')
        .doc('entry')
        .snapshots();
    StreamBuilder(
      stream: db2,
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return const Text("No data Available");
        } else {
          var document = snapshot.data as DocumentSnapshot;
          int sales = document["sales"];
          String date = document["date"];
          String name = document["name"];
          int revenue = document["revenue"];
          return RecentEntry(
            date: date,
            name: name,
            sales: sales.toString(),
            revenue: revenue.toString(),
          );
        }
      }),
    );
  }
}
