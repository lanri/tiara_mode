import 'package:flutter/material.dart';

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
