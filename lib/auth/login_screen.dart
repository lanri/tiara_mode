/***
login_screen.dart: Login Screen module
created by @lanri.jait@gmail.com
last committed by @
***/

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiara_mode/core/app_config.dart'; // berisi clientId

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: AppConfig.googleWebClientId, // ✅ Web client ID dari Firebase
    scopes: <String>[
      'email',
      'profile',
      'openid',
    ],
  );

  bool _isSigningIn = false;

  Future<void> _handleSignIn() async {
    setState(() => _isSigningIn = true);
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        setState(() => _isSigningIn = false);
        return; // batal login
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // ✅ Gunakan token untuk login ke Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final user = userCredential.user;
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Berhasil login sebagai ${user.displayName}')),
        );
        
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    } catch (error) {
      debugPrint('Login error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login gagal. Silakan coba lagi.')),
      );
    } finally {
      setState(() => _isSigningIn = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Owner / Partner')),
      body: Center(
        child: _isSigningIn
            ? const CircularProgressIndicator()
            : ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Login dengan Google'),
                onPressed: _handleSignIn,
              ),
      ),
    );
  }
}
