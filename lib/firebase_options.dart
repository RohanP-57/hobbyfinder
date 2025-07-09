
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyD7oa5m-FohbR0tDbSzBNwcswhrF7ZUq8E',
    appId: '1:415451161228:web:73a8e3bc7cf0de4798d1a9',
    messagingSenderId: '415451161228',
    projectId: 'hobbyfinder-d2494',
    authDomain: 'hobbyfinder-d2494.firebaseapp.com',
    storageBucket: 'hobbyfinder-d2494.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAPSWIlQ14uHcPLTmuqhTJzy8wrkT-210',
    appId: '1:415451161228:android:9e7f31805272d87698d1a9',
    messagingSenderId: '415451161228',
    projectId: 'hobbyfinder-d2494',
    storageBucket: 'hobbyfinder-d2494.firebasestorage.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATowzX3U8TpO7txaSLjjlZxydXouR-qrE',
    appId: '1:415451161228:ios:a27db3e65f0b257098d1a9',
    messagingSenderId: '415451161228',
    projectId: 'hobbyfinder-d2494',
    storageBucket: 'hobbyfinder-d2494.firebasestorage.app',
    iosBundleId: 'com.example.hobbyfinder',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD7oa5m-FohbR0tDbSzBNwcswhrF7ZUq8E',
    appId: '1:415451161228:web:b710a48216ee146798d1a9',
    messagingSenderId: '415451161228',
    projectId: 'hobbyfinder-d2494',
    authDomain: 'hobbyfinder-d2494.firebaseapp.com',
    storageBucket: 'hobbyfinder-d2494.firebasestorage.app',
  );
}
