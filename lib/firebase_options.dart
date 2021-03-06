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
    apiKey: 'AIzaSyC8PR8K5Qj8aCz5M34zaYKZMDeDusrWllA',
    appId: '1:45573437957:web:ccae319e7572493f867a6c',
    messagingSenderId: '45573437957',
    projectId: 'flutter-my-playground',
    authDomain: 'flutter-my-playground.firebaseapp.com',
    storageBucket: 'flutter-my-playground.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYnCd16dK01abco1pa2fXQw_qx0OEMNDY',
    appId: '1:45573437957:android:6d41063258a8663f867a6c',
    messagingSenderId: '45573437957',
    projectId: 'flutter-my-playground',
    storageBucket: 'flutter-my-playground.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsbkKYTlbTiT2XZIX2aIfHH0MzCeu51Rs',
    appId: '1:45573437957:ios:48baf5beb8de013c867a6c',
    messagingSenderId: '45573437957',
    projectId: 'flutter-my-playground',
    storageBucket: 'flutter-my-playground.appspot.com',
    iosClientId:
        '45573437957-4fs7i3j32n0p0lk4k26j7vvas7io07i4.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterPlayground',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsbkKYTlbTiT2XZIX2aIfHH0MzCeu51Rs',
    appId: '1:45573437957:ios:48baf5beb8de013c867a6c',
    messagingSenderId: '45573437957',
    projectId: 'flutter-my-playground',
    storageBucket: 'flutter-my-playground.appspot.com',
    iosClientId:
        '45573437957-4fs7i3j32n0p0lk4k26j7vvas7io07i4.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterPlayground',
  );
}
