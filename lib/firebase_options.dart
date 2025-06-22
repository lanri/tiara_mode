/***
firebase_options.dart: adding login using firebase and google
created by @lanri.jait@gmail.com
last committed by @lanri.jait@gmail.com
***/


import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return FirebaseOptions(
        apiKey: dotenv.env['API_KEY_WEB']!,
        appId: dotenv.env['APP_ID_WEB']!,
        messagingSenderId: dotenv.env['MSG_SENDER_ID_WEB']!,
        projectId: dotenv.env['PROJECT_ID']!,
        authDomain: dotenv.env['AUTH_DOMAIN'],
        storageBucket: dotenv.env['STORAGE_BUCKET'],
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return FirebaseOptions(
          apiKey: dotenv.env['API_KEY_ANDROID']!,
          appId: dotenv.env['APP_ID_ANDROID']!,
          messagingSenderId: dotenv.env['MSG_SENDER_ID_ANDROID']!,
          projectId: dotenv.env['PROJECT_ID']!,
          storageBucket: dotenv.env['STORAGE_BUCKET'],
        );
      case TargetPlatform.iOS:
        return FirebaseOptions(
          apiKey: dotenv.env['API_KEY_IOS']!,
          appId: dotenv.env['APP_ID_IOS']!,
          messagingSenderId: dotenv.env['MSG_SENDER_ID_IOS']!,
          projectId: dotenv.env['PROJECT_ID']!,
          storageBucket: dotenv.env['STORAGE_BUCKET'],
          iosClientId: dotenv.env['IOS_CLIENT_ID'],
          iosBundleId: dotenv.env['IOS_BUNDLE_ID'],
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}