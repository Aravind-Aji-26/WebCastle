
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome,James",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.notifications_outlined),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(65),
                    border: Border.all(color: const Color(0xffEDEDED))),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search_outlined,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Search..'),
                  ],
                ),
              ),
              const SizedBox(
                  width:
                      16.0), // Add some spacing between the search bar and button
              Container(
                height: 42,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    color: const Color(0xffFF2021),
                    borderRadius: BorderRadius.circular(65)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    "Scan Here",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
