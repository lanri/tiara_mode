import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      title: 'Tiara Mode',
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
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
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
        child: _widgetOptions.elementAt(_selectedIndex),
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

// --- 1. Home Screen ---
// The main landing page for the app.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiara Mode'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero section with a welcoming image and message
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://placehold.co/600x400/A9A9A9/FFFFFF?text=Selamat+Datang!'), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.3),
                alignment: Alignment.center,
                child: Text(
                  'Jahitan Halus, Gaya Modis',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              ),
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
                      onPressed: () { /* This would navigate, but is handled by bottom nav */ },
                      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                     icon: const Icon(Icons.info_outline),
                     label: const Text('Panduan Ukur Badan'),
                     onPressed: () => _showMeasurementGuide(context),
                     style: OutlinedButton.styleFrom(
                       minimumSize: const Size(double.infinity, 50),
                       foregroundColor: Theme.of(context).colorScheme.primary,
                       side: BorderSide(color: Theme.of(context).colorScheme.primary),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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

// --- 2. Portfolio Screen ---
// Displays a gallery of past work.
class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  // Placeholder data for portfolio items.
  // Replace these with your wife's actual work.
  final List<Map<String, String>> portfolioItems = const [
    {'image': 'https://placehold.co/400x600/E6E6FA/333333?text=Kebaya+Modern', 'title': 'Kebaya Modern'},
    {'image': 'https://placehold.co/400x600/FFE4E1/333333?text=Gamis+Pesta', 'title': 'Gamis Pesta'},
    {'image': 'https://placehold.co/400x600/B0C4DE/333333?text=Kemeja+Batik', 'title': 'Kemeja Batik Pria'},
    {'image': 'https://placehold.co/400x600/D3D3D3/333333?text=Dress+Anak', 'title': 'Dress Anak'},
    {'image': 'https://placehold.co/400x600/F5F5DC/333333?text=Blouse+Kerja', 'title': 'Blouse Kerja'},
    {'image': 'https://placehold.co/400x600/ADD8E6/333333?text=Celana+Formal', 'title': 'Celana Formal'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75, // Adjust aspect ratio for image shape
        ),
        itemCount: portfolioItems.length,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(portfolioItems[index]['title']!),
              ),
              child: Image.network(
                portfolioItems[index]['image']!,
                fit: BoxFit.cover,
                 errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- 3. Services Screen ---
// Lists all services offered with descriptions and starting prices.
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  // Placeholder data for services.
  final List<Map<String, String>> services = const [
    {'title': 'Jahit Baju Wanita (Gamis, Dress, Blouse)', 'price': 'Mulai dari Rp 250.000', 'desc': 'Jahitan halus untuk busana sehari-hari atau acara spesial.'},
    {'title': 'Jahit Baju Pria (Kemeja, Celana)', 'price': 'Mulai dari Rp 200.000', 'desc': 'Kemeja batik, formal, dan celana bahan dengan ukuran pas.'},
    {'title': 'Jahit Kebaya', 'price': 'Mulai dari Rp 400.000', 'desc': 'Pembuatan kebaya modern dan tradisional untuk wisuda atau pernikahan.'},
    {'title': 'Permak & Reparasi', 'price': 'Mulai dari Rp 25.000', 'desc': 'Potong celana, kecilkan baju, ganti ritsleting, dan lainnya.'},
    {'title': 'Upcycle Baju Lama', 'price': 'Hubungi untuk harga', 'desc': 'Ubah pakaian lama Anda menjadi model baru yang lebih segar.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layanan Kami'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                foregroundColor: Theme.of(context).colorScheme.primary,
                child: const Icon(Icons.cut),
              ),
              title: Text(services[index]['title']!, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(services[index]['desc']!, style: Theme.of(context).textTheme.bodyMedium),
                     const SizedBox(height: 8),
                     Text(services[index]['price']!, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- 4. Order Screen ---
// A form for customers to make an inquiry.
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _requestController = TextEditingController();

  // This function opens WhatsApp with a pre-filled message.
  void _sendToWhatsApp() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final phone = _phoneController.text;
      final request = _requestController.text;
      
      // --- IMPORTANT ---
      // Replace with your actual WhatsApp number, including the country code (62 for Indonesia).
      const businessWhatsAppNumber = '+6281234567890'; 

      final message = Uri.encodeComponent(
        'Halo Tiara Mode,\n\nSaya $name ($phone) ingin bertanya tentang:\n"$request"\n\nTerima kasih.'
      );

      final Uri whatsappUrl = Uri.parse('https://wa.me/$businessWhatsAppNumber?text=$message');

      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
      } else {
        // Show an error message if WhatsApp cannot be opened.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tidak bisa membuka WhatsApp. Pastikan aplikasi sudah ter-install.')),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _requestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesan atau Bertanya'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hubungi Kami',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Isi form di bawah ini untuk bertanya tentang jasa kami. Pesan akan dikirimkan melalui WhatsApp.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama Anda', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
                validator: (value) => value == null || value.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),
              // Phone Number Field
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Nomor WhatsApp', border: OutlineInputBorder(), prefixIcon: Icon(Icons.phone)),
                keyboardType: TextInputType.phone,
                validator: (value) => value == null || value.isEmpty ? 'Nomor WhatsApp tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),
              // Request Field
              TextFormField(
                controller: _requestController,
                decoration: const InputDecoration(labelText: 'Permintaan/Pertanyaan Anda', border: OutlineInputBorder(), prefixIcon: Icon(Icons.edit_note)),
                maxLines: 4,
                 validator: (value) => value == null || value.isEmpty ? 'Pertanyaan tidak boleh kosong' : null,
              ),
              const SizedBox(height: 32),
              // Submit Button
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('Kirim via WhatsApp'),
                onPressed: _sendToWhatsApp,
              ),
            ],
          ),
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