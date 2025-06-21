import 'package:flutter/material.dart';
import 'package:tiara_mode/pages/home_screen.dart';
import 'package:tiara_mode/pages/order_screen.dart';
import 'package:tiara_mode/pages/portfolio_screen.dart';
import 'package:tiara_mode/pages/services_screen.dart';


// To make this code work, you need to add the `url_launcher` package.
// Open your `pubspec.yaml` file and add this line under `dependencies`:
//
// dependencies:
//   flutter:
//     sdk: flutter
//   url_launcher: ^6.1.10 # Or the latest version
//
// Then run `flutter pub get` in your terminal.

void main() {
  runApp(const TiaraModeApp());
}

// --- Main Application Widget ---
// This is the root of your application.
class TiaraModeApp extends StatelessWidget {
  const TiaraModeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiara Mode Kebaya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // --- App Theme ---
        // Define the colors and fonts for the entire app here.
        // This color scheme uses a soft purple, elegant gold, and clean whites.
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF8F7FA),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF6A5ACD), // A nice shade of purple
          secondary: Color(0xFFD4AF37), // A touch of gold
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          background: Color(0xFFF8F7FA),
          surface: Colors.white,
        ),
        fontFamily: 'Poppins', // A modern and clean font (ensure you add it to pubspec.yaml)
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF333333)),
          titleTextStyle: TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6A5ACD), // Button color
            foregroundColor: Colors.white, // Text color
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

// --- Main Screen with Bottom Navigation ---
// This widget manages the main pages of the app.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of pages to be displayed.
  List<Widget> _widgetOptions() =>[
    HomeScreen(onPortfolioTap: () => _onItemTapped(1)),
    const PortfolioScreen(),
    const ServicesScreen(),
    const OrderScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cut),
            label: 'Layanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pesan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
