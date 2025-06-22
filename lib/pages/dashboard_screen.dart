/***
dashboard_screen.dart: Dashboard Screen module
created by @lanri.jait@gmail.com
last committed by @
***/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Sign out from Google (web-safe)
    try {
      await GoogleSignIn().signOut();
    } catch (e) {
      print("Google sign-out error: $e");
    }

    // Navigate back to login
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: user != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (user.photoURL != null)
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!),
                      radius: 40,
                    ),
                  const SizedBox(height: 12),
                  Text(
                    user.displayName ?? 'Nama tidak tersedia',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(user.email ?? 'Email tidak tersedia'),
                  const SizedBox(height: 20),
                  const Text("Selamat datang di Tiara Mode!"),
                ],
              )
            : const Text('User tidak ditemukan.'),
      ),
    );
  }
}
