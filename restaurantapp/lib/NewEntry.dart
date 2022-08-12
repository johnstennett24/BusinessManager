import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurantapp/BottomNavBar.dart';
import 'package:restaurantapp/AppBar.dart';

// ignore: must_be_immutable
class NewEntry extends StatelessWidget {
  TextEditingController actualsales = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController actualrevenue = TextEditingController();

  NewEntry({super.key});

  @override
  Widget build(BuildContext context) {
    final db =
        FirebaseFirestore.instance.collection('store1').doc('entry_dates');

    void updateRevenue(int revenue) {
      final db2 = FirebaseFirestore.instance
          .collection('store1')
          .doc("CI4bM8dwoLr3PUVZLnUn");
      db2.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          int number = data["revenue"];
          int newRevenue = number + revenue;
          data.update("revenue", (value) => newRevenue);
        },
      );
    }

    void addData(
      String date,
      String name,
      String actualsales,
      String actualrevenue,
    ) {
      final data = <String, dynamic>{
        "date": date,
        "name": name,
        "sales": int.parse(actualsales),
        "revenue": int.parse(actualrevenue)
      };
      int actualRevenue = int.parse(actualrevenue);
      db.set(data);
      updateRevenue(actualRevenue);
    }

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0), child: appBar()),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 0, right: 0, bottom: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  child: TextFormField(
                    controller: name,
                    obscureText: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Enter name here'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 0, right: 0, bottom: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  child: TextFormField(
                    controller: actualsales,
                    obscureText: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Actual Sales',
                        hintText: 'Sales'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 0, right: 0, bottom: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  child: TextFormField(
                    controller: actualrevenue,
                    obscureText: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Actual Revenue',
                        hintText: 'Revenue Actual'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 0, right: 0, bottom: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  child: TextFormField(
                    controller: date,
                    obscureText: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                        hintText: 'mm-dd-yy'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width - 45,
                  child: ElevatedButton(
                      onPressed: () {
                        addData(date.text, name.text, actualsales.text,
                            actualrevenue.text);
                        date.clear();
                        name.clear();
                        actualrevenue.clear();
                        actualsales.clear();
                      },
                      child: const Text("Submit")),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
