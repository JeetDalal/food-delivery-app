import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInGoogle extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future loginWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    } else {
      _user == googleUser;
      final gAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => log('Signed In successfully'));
      notifyListeners();
    }
  }
}
