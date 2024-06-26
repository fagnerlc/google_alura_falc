// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB0j1B4Cj7m2MPOq_daysTnIH5wlM1xjZQ',
    appId: '1:179309879409:web:7678f48c8690a8a15afbd0',
    messagingSenderId: '179309879409',
    projectId: 'alura--falc',
    authDomain: 'alura--falc.firebaseapp.com',
    storageBucket: 'alura--falc.appspot.com',
    measurementId: 'G-J1YW9Q6JQ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHr51NQRvA7_gQhdKBa0QrASIgXt8zplk',
    appId: '1:179309879409:android:b8b17b54f831f2095afbd0',
    messagingSenderId: '179309879409',
    projectId: 'alura--falc',
    storageBucket: 'alura--falc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDT527Ml9pwlVcgbO-rIX_wG8VrPvega4Q',
    appId: '1:179309879409:ios:ce5f605eed384f2f5afbd0',
    messagingSenderId: '179309879409',
    projectId: 'alura--falc',
    storageBucket: 'alura--falc.appspot.com',
    iosBundleId: 'com.example.googleAluraFalc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDT527Ml9pwlVcgbO-rIX_wG8VrPvega4Q',
    appId: '1:179309879409:ios:f238c3e6ed4484b25afbd0',
    messagingSenderId: '179309879409',
    projectId: 'alura--falc',
    storageBucket: 'alura--falc.appspot.com',
    iosBundleId: 'com.example.googleAluraFalc.RunnerTests',
  );
}
