import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:restaurantapp/AppBar.dart';
import 'package:restaurantapp/ProgressCards.dart';
import 'package:restaurantapp/BottomNavBar.dart';
import 'package:restaurantapp/RecentEntry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance.collection('store1');
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0), child: appBar()),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 350,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          StreamBuilder(
                            stream: db.doc("CI4bM8dwoLr3PUVZLnUn").snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return CircularPercentIndicator(radius: 12);
                              } else {
                                var document =
                                    snapshot.data as DocumentSnapshot;
                                int revenue = document["revenue"];
                                int revGoal = document["rev_goal"];
                                return ProgressCard(
                                  progress: revenue,
                                  goal: revGoal,
                                  indicator: "REVENUE",
                                );
                              }
                            },
                          ),
                          StreamBuilder(
                            stream: db.doc("CI4bM8dwoLr3PUVZLnUn").snapshots(),
                            builder: ((context, snapshot) {
                              if (!snapshot.hasData) {
                                return CircularPercentIndicator(radius: 12);
                              } else {
                                var document =
                                    snapshot.data as DocumentSnapshot;
                                int sales = document["sales"];
                                int salesGoal = document["sales_goal"];
                                return ProgressCard(
                                  progress: sales,
                                  goal: salesGoal,
                                  indicator: "SALES",
                                );
                              }
                            }),
                          ),
                          StreamBuilder(
                            stream: db.doc("CI4bM8dwoLr3PUVZLnUn").snapshots(),
                            builder: ((context, snapshot) {
                              if (!snapshot.hasData) {
                                return CircularPercentIndicator(radius: 12);
                              } else {
                                var document =
                                    snapshot.data as DocumentSnapshot;
                                int satisfaction = document["satisfaction"];
                                int satisGoal = document["satis_goal"];
                                return ProgressCard(
                                  progress: satisfaction,
                                  goal: satisGoal,
                                  indicator: "SATISFY",
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Most Recent Entry",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder(
                          stream: db.doc("entry_dates").snapshots(),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
