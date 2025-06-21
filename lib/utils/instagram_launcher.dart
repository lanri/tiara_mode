/***
instagram_launcher.dart: Instagram Launcher module
created by @lanri.jait@gmail.com
last committed by @
***/

// lib/utils/instagram_launcher.dart
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';

class InstagramLauncher {
  static const String username = 'mode_tiara';

  static Future<void> openInstagram() async {
    final instagramAppUrl = 'instagram://user?username=$username';
    final instagramWebUrl = 'https://www.instagram.com/$username/';

    if (kIsWeb) {
      await launchUrl(Uri.parse(instagramWebUrl), mode: LaunchMode.externalApplication);
      return;
    }

    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'action_view',
        data: instagramWebUrl,
        package: 'com.instagram.android',
        flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
      );

      try {
        await intent.launch();
      } catch (_) {
        await launchUrl(Uri.parse(instagramWebUrl), mode: LaunchMode.externalApplication);
      }
    } else if (Platform.isIOS) {
      final appUri = Uri.parse(instagramAppUrl);
      final webUri = Uri.parse(instagramWebUrl);

      if (await canLaunchUrl(appUri)) {
        await launchUrl(appUri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    } else {
      await launchUrl(Uri.parse(instagramWebUrl), mode: LaunchMode.externalApplication);
    }
  }
}
