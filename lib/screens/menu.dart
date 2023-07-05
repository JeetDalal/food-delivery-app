import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RestaurantMenuScreen extends StatelessWidget {
  const RestaurantMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final _provider = Provider.of<CartProvider>(context);
    _provider.setRestId(id);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          HeadBar(id: id),

          //Filters
          FilterSection(),
          const SizedBox(
            height: 50,
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('menu')
                  .doc(id)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = (snapshot.data!.data()
                          as Map<String, dynamic>)['menuList']
                      .toList();
                  return Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final dataItem = data[index] as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 200,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              FilterLogo(
                                                color: dataItem['type'] == 2
                                                    ? Colors.red
                                                    : Colors.green,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            dataItem['itemName'],
                                            style: GoogleFonts.barlow(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            dataItem['desc'],
                                            style: GoogleFonts.barlow(
                                              color: Colors.grey,

                                              // fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "₹ ${dataItem['price']}",
                                            style: GoogleFonts.barlow(
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          !_provider.keys
                                                  .contains(dataItem['id'])
                                              ? GestureDetector(
                                                  onTap: () {
                                                    // log(_provider.cart
                                                    //     .contains(
                                                    //         dataItem['id'])
                                                    //     .toString());
                                                    _provider.setCartRestId(id);
                                                    _provider.addItemToCart(
                                                        dataItem['id'],
                                                        dataItem['itemName'],
                                                        dataItem['price'],
                                                        dataItem['image']);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Text(
                                                        'Add',
                                                        style:
                                                            GoogleFonts.barlow(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Row(
                                                  children: [
                                                    //Add
                                                    GestureDetector(
                                                      onTap: () {
                                                        _provider.addItemToCart(
                                                            dataItem['id'],
                                                            dataItem[
                                                                'itemName'],
                                                            dataItem['price'],
                                                            dataItem['image']);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[200],
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                          ),
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.black,
                                                              size: 13,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    //Count
                                                    Container(
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Center(
                                                          child: Text(
                                                            _provider.cart
                                                                .firstWhere((element) =>
                                                                    element[
                                                                        'id'] ==
                                                                    dataItem[
                                                                        'id'])[
                                                                    'quantity']
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .barlow(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    //subtract
                                                    GestureDetector(
                                                      onTap: () {
                                                        _provider
                                                            .removeItemFromCart(
                                                                dataItem['id']);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[200],
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5),
                                                          ),
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.black,
                                                              size: 13,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          top: 0,
                                          right: 0,
                                          left: 0,
                                          child: Container(
                                            height: 150,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    dataItem['image'],
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Filters',
                  style: GoogleFonts.barlow(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Row(
            children: [
              Filter.veg(),
              const SizedBox(
                width: 10,
              ),
              Filter.nonVeg(),
            ],
          ),
        ),
      ],
    );
  }
}

class Filter extends StatelessWidget {
  String filterName;
  Color color;

  Filter({required this.color, required this.filterName});

  Filter.veg({this.color = Colors.green, this.filterName = 'Veg'});
  Filter.nonVeg({this.color = Colors.red, this.filterName = 'Non-Veg'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          // color: Colors.grey,
          border: Border.all(
            color: Colors.grey,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              FilterLogo(color: color),
              const SizedBox(
                width: 5,
              ),
              Text(
                filterName,
                style: GoogleFonts.barlow(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterLogo extends StatelessWidget {
  const FilterLogo({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: color,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.circle,
          size: 22,
          color: color,
        ),
      ),
    );
  }
}

class HeadBar extends StatelessWidget {
  const HeadBar({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('company')
              .doc(id)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                children: [
                  Text(
                    data['companyName'],
                    style: GoogleFonts.barlow(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 2,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        data['foodStyle'],
                        style: GoogleFonts.barlow(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Text(
                                '4.1',
                                style: GoogleFonts.barlow(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 12,
                              ),
                            ],
                          ),
                        )),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        '1.1K reviews',
                        style: TextStyle(
                          // decoration: TextDecoration.underline,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.green[600],
                                  size: 13,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '30-35 min | 2km',
                                  style: GoogleFonts.barlow(
                                    // color: Colors.grey,
                                    // fontWeight: fontwei,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '|',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Al Ain',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
