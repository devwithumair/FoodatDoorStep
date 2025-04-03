// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDnKh9fk8qDE-L-ROOxYUpwZIJKL2k_OUk',
    appId: '1:215579603259:web:2d4583fc87f94cc2b0871e',
    messagingSenderId: '215579603259',
    projectId: 'footatdoorstep',
    authDomain: 'footatdoorstep.firebaseapp.com',
    storageBucket: 'footatdoorstep.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4NxwI0nMNIvGjkGLtdeY8duzPyOVDoIU',
    appId: '1:215579603259:android:52471ccdb65b7badb0871e',
    messagingSenderId: '215579603259',
    projectId: 'footatdoorstep',
    storageBucket: 'footatdoorstep.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDkIazAVWJYjJNlRcYCa0oer_yxHuzQmM',
    appId: '1:215579603259:ios:26588737d7eb7a71b0871e',
    messagingSenderId: '215579603259',
    projectId: 'footatdoorstep',
    storageBucket: 'footatdoorstep.firebasestorage.app',
    iosBundleId: 'com.example.footatdoorstep',
  );
}
