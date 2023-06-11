import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '----------------',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            '-----------------',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
