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
    apiKey: 'AIzaSyALkrIgPlWFGEBE0fUj20lYbpjS9aYY4Cc',
    appId: '1:663387297233:web:14349e4878fd58b1c33cf0',
    messagingSenderId: '663387297233',
    projectId: 'anketdemo-8e225',
    authDomain: 'anketdemo-8e225.firebaseapp.com',
    storageBucket: 'anketdemo-8e225.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0MafNcVzy4Gi9JV8i9mO362C4g4G80C4',
    appId: '1:663387297233:android:10d16c73db4905abc33cf0',
    messagingSenderId: '663387297233',
    projectId: 'anketdemo-8e225',
    storageBucket: 'anketdemo-8e225.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3hBoZ7iuRiUKraCZSnF2TNwSF8pQbLVk',
    appId: '1:663387297233:ios:274bdb46a8aa4878c33cf0',
    messagingSenderId: '663387297233',
    projectId: 'anketdemo-8e225',
    storageBucket: 'anketdemo-8e225.appspot.com',
    iosClientId: '663387297233-0td4mu5q0ls1fcifkhl5a2nvqdfj74m0.apps.googleusercontent.com',
    iosBundleId: 'com.sv.firebaseDeneme',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3hBoZ7iuRiUKraCZSnF2TNwSF8pQbLVk',
    appId: '1:663387297233:ios:274bdb46a8aa4878c33cf0',
    messagingSenderId: '663387297233',
    projectId: 'anketdemo-8e225',
    storageBucket: 'anketdemo-8e225.appspot.com',
    iosClientId: '663387297233-0td4mu5q0ls1fcifkhl5a2nvqdfj74m0.apps.googleusercontent.com',
    iosBundleId: 'com.sv.firebaseDeneme',
  );
}