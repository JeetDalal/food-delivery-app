import 'package:flutter/material.dart';

class RestaurantMenuScreen extends StatelessWidget {
  const RestaurantMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
