import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/location_service.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:provider/provider.dart';

import '../utils/header.dart';
import '../utils/restaurant_card.dart';
import '../utils/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: ListView(
          children: [
            const TopBar(),
            const SizedBox(
              height: 30,
            ),
            const Header(
              title: 'WHAT\'S ON YOUR MIND?',
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: GridView.builder(
                itemCount: cat.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    child: Container(
                      height: 100,
                      width: 150,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              cat[index].imageUrl,
                              // fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            cat[index].name,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Header(title: 'ALL RESTAURANTS'),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('company')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data?.docs;
                      log(data![0].toString());
                      log(data.toString());
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final perData = data[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 10,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  final companyId = perData.id;
                                  Navigator.of(context).pushNamed(
                                      '/menu-screen',
                                      arguments: companyId);
                                },
                                child: RestaurantCard(
                                  imageUrl: (perData['brandImages'].toList()[0]
                                      as Map<String, dynamic>)['imageUrl'],
                                  name: perData['companyName'],
                                  type: perData['foodStyle'],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
