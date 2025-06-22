# 🧾 Technical Documentation – Tiara Mode Flutter App

## 📌 Project Overview

**Tiara Mode** is a Flutter application built to promote a kebaya tailoring business. It features a beautiful landing UI, Instagram portfolio link, measurement guide, and order screen. It supports deployment on the **web** (via GitHub Pages) and mobile.

---

## 🔧 Development Environment

| Tool              | Version            |
|-------------------|--------------------|
| Flutter SDK       | ≥ 3.10.0           |
| Dart SDK          | ≥ 3.0.0            |
| Target Platforms  | Flutter Web, Android, iOS |
| Package Manager   | `pub`              |

### 📦 Dependencies (in `pubspec.yaml`)

dependencies:
  flutter:
    sdk: flutter
  url_launcher: ^6.1.10
  font_awesome_flutter: ^10.5.0
  # Add other dependencies here

---
## Structure Folder
lib/
├── main.dart                      # Entry point with theme and routing
├── utils/
│   └── instagram_launcher.dart    # Opens Instagram app or browser
├── pages/
│   ├── home_screen.dart           # Landing page with banner, logo, buttons
│   ├── portfolio_screen.dart      # Opens Instagram profile
│   ├── services_screen.dart       # Displays tailoring services
│   └── order_screen.dart          # Page for order form (WIP)
assets/
├── images/
│   └── tiara-mode-banner.webp     # Main hero image
└── logo.png                       # App branding logo

---

## Web deployment
flutter build web
git add build/web -f
git commit -m "Build web"
git subtree push --prefix build/web origin gh-pages

## TODO
 Add actual measurement guide content

 Replace Instagram button with embedded preview (optional)

 Build order form (with validation and submission)

 Use routing (go_router or Navigator) for better navigation

 SEO Meta tags for web

 Add unit/widget testing (flutter_test)

## Contribution Guide
Fork this repo

Run flutter pub get

Create a new branch

Commit your changes

Submit a Pull Request