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
    apiKey: 'AIzaSyA9zaORULej7L7KcclUEOTqEVpACrMnfLI',
    appId: '1:200376801851:web:933b01a6f6c7bc672e5a1e',
    messagingSenderId: '200376801851',
    projectId: 'yu-events-688db',
    authDomain: 'yu-events-688db.firebaseapp.com',
    storageBucket: 'yu-events-688db.firebasestorage.app',
    measurementId: 'G-60KLVBF7H0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIhnwojC_n4OljM2IuN11cp3Y1l2cvH0A',
    appId: '1:200376801851:android:661ebe1d8c84abe72e5a1e',
    messagingSenderId: '200376801851',
    projectId: 'yu-events-688db',
    storageBucket: 'yu-events-688db.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDILmZUedYvjygJi8mh5jZPoblbGkplkWA',
    appId: '1:200376801851:ios:6d671915b279265c2e5a1e',
    messagingSenderId: '200376801851',
    projectId: 'yu-events-688db',
    storageBucket: 'yu-events-688db.firebasestorage.app',
    iosBundleId: 'com.example.yuEvents',
  );
}