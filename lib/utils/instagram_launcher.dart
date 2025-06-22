/***
instagram_launcher.dart: add instagram dialog launcher
created by @lanri.jait@gmail.com
last committed by @lanri.jait@gmail.com
***/


import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:tiara_mode/core/app_config.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramLauncher {
  static const String _username = AppConfig.instagramUserName;
  static final Uri _webUri = Uri.parse('https://www.instagram.com/$_username/');

  static Future<void> openWithSuggestion(BuildContext context) async {
    // Always open in browser first
    await launchUrl(_webUri, mode: LaunchMode.externalApplication);

    if (Platform.isAndroid || Platform.isIOS) {
      await Future.delayed(const Duration(milliseconds: 800)); // slight delay
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Gunakan Aplikasi Instagram'),
          content: const Text(
            'Untuk pengalaman terbaik dan membuka langsung ke akun kami, gunakan aplikasi Instagram resmi. '
            'Jika Anda melihat Instagram Lite, coba uninstall atau buka lewat aplikasi penuh.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Tutup'),
            ),
            TextButton(
              onPressed: () async {
                final appStoreUri = Platform.isIOS
                    ? Uri.parse('https://apps.apple.com/app/instagram/id389801252')
                    : Uri.parse('https://play.google.com/store/apps/details?id=com.instagram.android');
                Navigator.of(ctx).pop();
                await launchUrl(appStoreUri, mode: LaunchMode.externalApplication);
              },
              child: const Text('Lihat di App Store / Play Store'),
            ),
          ],
        ),
      );
    }
  }
}
