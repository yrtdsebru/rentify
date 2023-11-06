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
    apiKey: 'AIzaSyBnNOdhepocX_1kn13XlW--BHNsLjxOa7U',
    appId: '1:574364250512:web:2e16d8ce67fd37ce73c315',
    messagingSenderId: '574364250512',
    projectId: 'rentify-57394',
    authDomain: 'rentify-57394.firebaseapp.com',
    storageBucket: 'rentify-57394.appspot.com',
    measurementId: 'G-75T3M68EQ6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHnJUHQLOOQkVQ5a6V6q7ApfOIxhbh1tE',
    appId: '1:574364250512:android:063f6297119cc03373c315',
    messagingSenderId: '574364250512',
    projectId: 'rentify-57394',
    storageBucket: 'rentify-57394.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEbbcZp0fs-w9ifj0RXj5WOnWUTFWkHLI',
    appId: '1:574364250512:ios:f5ca92eba3a7654773c315',
    messagingSenderId: '574364250512',
    projectId: 'rentify-57394',
    storageBucket: 'rentify-57394.appspot.com',
    iosBundleId: 'com.example.rentify',
  );
}
