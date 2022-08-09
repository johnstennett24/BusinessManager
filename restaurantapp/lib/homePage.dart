import 'package:flutter/material.dart';
import 'package:restaurantapp/ProgressCards.dart';
import 'package:restaurantapp/BottomNavBar.dart';
import 'package:restaurantapp/RecentEntry.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35.0),
        child: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Business Manager",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
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
                        children: const [
                          ProgressCard(
                            indicator: "REVENUE",
                          ),
                          ProgressCard(
                            indicator: "SALES",
                          ),
                          ProgressCard(
                            indicator: "RETENTION",
                          ),
                          ProgressCard(
                            indicator: "QUALITY",
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Recent Entries",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        RecentEntry(
                            type: "Sales",
                            goal: 3333.33,
                            name: "John Stennett",
                            date: "01/23/2022",
                            amount: "2500"),
                        RecentEntry(
                            type: "Sales",
                            goal: 3333.33,
                            name: "John Stennett",
                            date: "01/24/2022",
                            amount: "\$3000"),
                        RecentEntry(
                            type: "Sales",
                            goal: 3333.33,
                            name: "John Stennett",
                            date: "01/24/2022",
                            amount: "\$3000"),
                        RecentEntry(
                            type: "Sales",
                            goal: 3333.33,
                            name: "John Stennett",
                            date: "01/25/2022",
                            amount: "\$3000"),
                        RecentEntry(
                            type: "Quality",
                            goal: 75.5,
                            name: "John Stennett",
                            date: "01/26/2022",
                            amount: "%68.6"),
                        RecentEntry(
                            type: "Sales",
                            goal: 3333.33,
                            name: "John Stennett",
                            date: "01/27/2022",
                            amount: "\$3000"),
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
