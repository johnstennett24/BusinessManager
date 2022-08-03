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
    apiKey: 'AIzaSyCFcZgKQXLVkOQu_0vr5KOOP_GS6uKYqts',
    appId: '1:544633537464:web:e093ede5406fbebe07854d',
    messagingSenderId: '544633537464',
    projectId: 'businessapp-44538',
    authDomain: 'businessapp-44538.firebaseapp.com',
    storageBucket: 'businessapp-44538.appspot.com',
    measurementId: 'G-WE7HDYDHDG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGw8hWrvluEM-xiLiNbF8jr6EX56I_Cfo',
    appId: '1:544633537464:android:6dbebbf29f152b2107854d',
    messagingSenderId: '544633537464',
    projectId: 'businessapp-44538',
    storageBucket: 'businessapp-44538.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNzAw6vebPdDl8uHCcC29IWH-WZl2PF5Y',
    appId: '1:544633537464:ios:6b1eb625cb08c7bd07854d',
    messagingSenderId: '544633537464',
    projectId: 'businessapp-44538',
    storageBucket: 'businessapp-44538.appspot.com',
    iosClientId: '544633537464-8l791o17tahiu4lg163ikoof826vr84u.apps.googleusercontent.com',
    iosBundleId: 'com.example.restaurantapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNzAw6vebPdDl8uHCcC29IWH-WZl2PF5Y',
    appId: '1:544633537464:ios:6b1eb625cb08c7bd07854d',
    messagingSenderId: '544633537464',
    projectId: 'businessapp-44538',
    storageBucket: 'businessapp-44538.appspot.com',
    iosClientId: '544633537464-8l791o17tahiu4lg163ikoof826vr84u.apps.googleusercontent.com',
    iosBundleId: 'com.example.restaurantapp',
  );
}
