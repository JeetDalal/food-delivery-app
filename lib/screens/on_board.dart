import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  OnBoarding({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 135,
          ),
          SizedBox(
            height: 350,
            width: 350,
            child: Image.asset(
              imageUrl,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
