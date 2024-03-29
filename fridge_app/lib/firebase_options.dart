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
    apiKey: 'AIzaSyCbR0UMB46dEE39J2YJtE1a4b4cWKBKGyw',
    appId: '1:510201846832:web:50205125c7db99a7d261f5',
    messagingSenderId: '510201846832',
    projectId: 'setap-fridge-app',
    authDomain: 'setap-fridge-app.firebaseapp.com',
    storageBucket: 'setap-fridge-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4fCAB7Z2zdqlujvUu8vs1E7nI8lr8CIs',
    appId: '1:510201846832:android:1b0b1ca982209f8bd261f5',
    messagingSenderId: '510201846832',
    projectId: 'setap-fridge-app',
    storageBucket: 'setap-fridge-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6kf6JNAb1MsKYGbUBiLKqOERWT-EwgXE',
    appId: '1:510201846832:ios:cc7212803d02dc3dd261f5',
    messagingSenderId: '510201846832',
    projectId: 'setap-fridge-app',
    storageBucket: 'setap-fridge-app.appspot.com',
    iosClientId: '510201846832-g9mtbh8d47t9un3ci2c3juiak5af5gt4.apps.googleusercontent.com',
    iosBundleId: 'com.example.fridgeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6kf6JNAb1MsKYGbUBiLKqOERWT-EwgXE',
    appId: '1:510201846832:ios:cc7212803d02dc3dd261f5',
    messagingSenderId: '510201846832',
    projectId: 'setap-fridge-app',
    storageBucket: 'setap-fridge-app.appspot.com',
    iosClientId: '510201846832-g9mtbh8d47t9un3ci2c3juiak5af5gt4.apps.googleusercontent.com',
    iosBundleId: 'com.example.fridgeApp',
  );
}
