import 'package:flutter/material.dart';
import 'package:tiara_mode/main.dart';
import 'package:tiara_mode/pages/portfolio_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onPortfolioTap;

  const HomeScreen({super.key, this.onPortfolioTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiara Mode Kebaya'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 💠 Tiara Mode Logo
            Image.asset(
              'assets/logo.png',
              width: 120,
              height: 120,
            ),
            // Hero section with a welcoming image and message
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tiara-mode-banner.webp'),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Container(
              //   color: Colors.black.withOpacity(0.3),
              //   alignment: Alignment.center,
              //   child: Text(
              //     'Jahitan Halus, Gaya Modis',
              //     style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontSize: 28),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
            ),
            const SizedBox(height: 24),
            // Introduction Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Selamat datang di Tiara Mode, penjahit kepercayaan Anda di Parung Panjang. Kami menyediakan jasa jahit custom dan vermak berkualitas tinggi untuk semua kebutuhan busana Anda.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 32),
            // Quick navigation buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text('Lihat Portfolio Kami'),
                    onPressed: onPortfolioTap,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50)),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.info_outline),
                    label: const Text('Panduan Ukur Badan'),
                    onPressed: () => _showMeasurementGuide(context),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
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
