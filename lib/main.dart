import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/on_board.dart';
import 'screens/screen_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.dmSans(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          titleSmall: GoogleFonts.dmSans(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
      home: MainScreenController(),
      routes: {
        '/login-screen': (context) => const LoginScreen(),
      },
    );
  }
}
