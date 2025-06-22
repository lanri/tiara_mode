/***
auth_service.dart: Auth Service module
created by @lanri.jait@gmail.com
last committed by @
***/

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tiara_mode/firebase_options.dart'; // 🔥 your generated config

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        // 👇 Use correct web client ID here
        final googleProvider = GoogleAuthProvider();
        return await _auth.signInWithPopup(googleProvider);
      }

      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Google Sign-In error: $e');
      rethrow;
    }
  }

  static Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }
}
