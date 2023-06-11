import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colors
final buttonColor = Colors.red.shade400;
final kPrimaryColor = Colors.orange.shade400;

class Categories {
  final String name;
  final String imageUrl;
  Categories({
    required this.name,
    required this.imageUrl,
  });
}

List<Categories> cat = [
  Categories(
    name: 'Pizza',
    imageUrl: 'images/pizza.png',
  ),
  Categories(
    name: 'burger',
    imageUrl: 'images/burger.png',
  ),
  Categories(
    name: 'thali',
    imageUrl: 'images/thali.png',
  ),
  Categories(
    name: 'Sweets',
    imageUrl: 'images/sweets.png',
  ),
  Categories(
    name: 'Chinese',
    imageUrl: 'images/chinese.png',
  ),
  Categories(
    name: 'Biryani',
    imageUrl: 'images/biryani.png',
  ),
  Categories(
    name: 'Ice Cream',
    imageUrl: 'images/icecream.png',
  ),
  Categories(
    name: 'Drinks',
    imageUrl: 'images/drinks.png',
  ),
];
