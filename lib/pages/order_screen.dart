/***
order_screen.dart: add read me and app config
created by @lanri.jait@gmail.com
last committed by @lanri.jait@gmail.com
***/


import 'package:flutter/material.dart';
import 'package:tiara_mode/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tiara_mode/core/app_config.dart';

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
      const appName = AppConfig.appName;
      
      // --- IMPORTANT ---
      // Replace with your actual WhatsApp number, including the country code (62 for Indonesia).
      const businessWhatsAppNumber = AppConfig.whatsappNumber; 

      final message = Uri.encodeComponent(
        'Halo $appName ,\n\nSaya $name ($phone) ingin bertanya tentang:\n"$request"\n\nTerima kasih.'
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

