import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery_app/services/auth_service.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      final currentUser =
          Provider.of<SignInGoogle>(context, listen: false).user;
      if (currentUser != null) {
        Navigator.of(context).pushReplacementNamed('/location-screen');
      }
      super.initState();
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/login.png',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Sign in to continue or',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/register-screen');
                    },
                    child: Text(
                      'create new account',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: kPrimaryColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            height: 44,
            width: 305,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Username or Email',
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 44,
            width: 305,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 44,
            width: 305,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kPrimaryColor,
            ),
            child: Center(
              child: Text(
                'Sign in',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: kPrimaryColor,
                    // decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: VerticalDivider(
                  thickness: 5,
                  // endIndent: 5,
                  color: Colors.black,
                ),
              ),
              Text(
                'OR',
                style: TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: VerticalDivider(
                  thickness: 5,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            splashColor: Colors.orange,
            onTap: () {
              final provider = Provider.of<SignInGoogle>(context, listen: false)
                  .loginWithGoogle()
                  .then((value) {
                Navigator.of(context).pushReplacementNamed('/address-screen');
              });
            },
            child: Container(
              height: 44,
              width: 305,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/google.png'),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Connect with Google',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 44,
            width: 305,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/fb.png'),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Connect with Facebook',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
