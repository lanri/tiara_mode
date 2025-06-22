/***
app_config.dart: add read me and app config
created by @lanri.jait@gmail.com
last committed by @lanri.jait@gmail.com
***/


// lib/core/app_config.dart

import 'package:flutter/material.dart';

class AppConfig {
  /// BRANDING
  static const String appName = 'Tiara Mode';
  static const String titleName = 'Tiara Mode Kebaya';
  static const String appTagline = 'Jahitan Halus, Gaya Modis';
  static const String logoAssetPath = 'assets/logo.png';
  static const String bannerAssetPath = 'assets/images/tiara-mode-banner.webp';

  /// COLORS & THEME
  static const Color primaryColor = Color(0xFF6A5ACD); // Royal Purple
  static const Color accentColor = Color(0xFFD4AF37);   // Gold
  static const Color backgroundColor = Color(0xFFF8F7FA);
  static const Color surfaceColor = Colors.white;
  static const Color buttonTextColor = Colors.white;
  static const Color textColor = Color(0xFF333333);

  /// FONTS
  static const String fontFamily = 'Poppins';

  /// CONTACT & SOCIAL
  static const String whatsappNumber = '+6281370603031';
  static const String instagramUserName = 'mode_tiara';
  static const String location = 'Parung Panjang';

  /// FEATURES TO ENABLE
  static const bool enableLogin = true;
  static const bool enablePartnerRole = true;
  static const bool enableOrderForm = true;
  static const bool useWhatsAppOrder = true;
  static const bool useInstagramPortfolio = true;
}