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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQ78pgAPsRrxVvKsokKEMxe4vcikH9Tcw',
    appId: '1:82445791465:android:1a0e1dd78a224b92a2c078',
    messagingSenderId: '82445791465',
    projectId: 'todo-list-9d191',
    storageBucket: 'todo-list-9d191.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSzp3l6R5j-RGOSwzMfMZ7Wdw3nTnUi6o',
    appId: '1:82445791465:ios:d625ed41cd84597ca2c078',
    messagingSenderId: '82445791465',
    projectId: 'todo-list-9d191',
    storageBucket: 'todo-list-9d191.appspot.com',
    iosClientId: '82445791465-23umao3i9ps3gcr5oaaqu8nppc399rk4.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDSzp3l6R5j-RGOSwzMfMZ7Wdw3nTnUi6o',
    appId: '1:82445791465:ios:d625ed41cd84597ca2c078',
    messagingSenderId: '82445791465',
    projectId: 'todo-list-9d191',
    storageBucket: 'todo-list-9d191.appspot.com',
    iosClientId: '82445791465-23umao3i9ps3gcr5oaaqu8nppc399rk4.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoList',
  );
}
