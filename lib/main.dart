import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/cart_provider.dart';
import 'package:food_delivery_app/screens/address.dart';
import 'package:food_delivery_app/screens/login.dart';
import 'package:food_delivery_app/screens/main_screen.dart';
import 'package:food_delivery_app/screens/menu.dart';
import 'package:food_delivery_app/services/auth_service.dart';
import 'package:food_delivery_app/services/location_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/on_board.dart';
import 'screens/register.dart';
import 'screens/screen_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInGoogle(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
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
        home: HomeScreen(),
        routes: {
          '/login-screen': (context) => const LoginScreen(),
          '/register-screen': (context) => const RegisterScreen(),
          '/address-screen': (context) => const Address(),
          '/home-screen': (context) => const HomeScreen(),
          '/menu-screen': (context) => const RestaurantMenuScreen(),
        },
      ),
    );
  }
}
