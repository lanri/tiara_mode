/***
home_screen.dart: add read me and app config
created by @lanri.jait@gmail.com
last committed by @lanri.jait@gmail.com
***/



import 'package:tiara_mode/core/app_config.dart';
import 'package:flutter/material.dart';
import 'package:tiara_mode/main.dart';
import 'package:tiara_mode/pages/portfolio_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tiara_mode/utils/instagram_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onPortfolioTap;

  const HomeScreen({super.key, this.onPortfolioTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppConfig.logoAssetPath,
              width: 28,
              height: 28,
            ),
            //const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 20),
                children: [
                  TextSpan(
                    text: AppConfig.titleName,
                    style: TextStyle(
                      fontFamily: AppConfig.fontFamily,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6A5ACD), // royal purple
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        // 👉 Add the quick navigation buttons to the bottom of AppBar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFDF8FF), // Light lavender
                  Color.fromARGB(
                      255, 225, 212, 243), // Slightly deeper lavender
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: const FaIcon(FontAwesomeIcons.instagram),
                    label: const Text('Lihat Portfolio Kami di Instagram'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFE1306C), // Instagram pink
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () =>
                        InstagramLauncher.openWithSuggestion(context),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.info_outline),
                    label: const Text('Panduan Ukur Badan'),
                    onPressed: () => _showMeasurementGuide(context),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                      foregroundColor: Color(0xFF6A5ACD),
                      side: const BorderSide(color: Color(0xFF6A5ACD)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
  child: Column(
    children: [
      // Your banner
      Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          AppConfig.bannerAssetPath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),

      // Other content...
    ],
  ),
),
    );
  }
}

// --- Measurement Guide Dialog ---
// A helper function to show a popup with measurement instructions.
void _showMeasurementGuide(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Panduan Ukur Badan'),
        content: const SingleChildScrollView(
          child: Text(
            'Berikut adalah cara mengambil ukuran badan dasar:\n\n'
            '1. Lingkar Dada: Ukur sekeliling bagian dada yang paling besar.\n\n'
            '2. Lingkar Pinggang: Ukur sekeliling bagian pinggang yang paling kecil.\n\n'
            '3. Lingkar Panggul: Ukur sekeliling bagian panggul yang paling besar.\n\n'
            '4. Panjang Lengan: Ukur dari puncak bahu hingga panjang yang diinginkan.\n\n'
            '5. Panjang Busana: Ukur dari bahu tertinggi (dekat leher) hingga panjang yang diinginkan.\n\n'
            'Pastikan meteran tidak terlalu ketat atau terlalu longgar.',
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Mengerti'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
