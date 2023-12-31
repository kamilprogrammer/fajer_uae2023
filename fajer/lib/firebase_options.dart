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
    apiKey: 'AIzaSyDtBsCOyklR97fZRn-dIQdKdlDRpF4RQBw',
    appId: '1:675234341647:web:33717b8a63490dc06e947a',
    messagingSenderId: '675234341647',
    projectId: 'fajer-pro-uae2023',
    authDomain: 'fajer-pro-uae2023.firebaseapp.com',
    storageBucket: 'fajer-pro-uae2023.appspot.com',
    measurementId: 'G-7CBNXT1X09',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVWQ_K_uFD9NrAK451wqtXWTk0zX4vrMQ',
    appId: '1:675234341647:android:fc9ba196786f469f6e947a',
    messagingSenderId: '675234341647',
    projectId: 'fajer-pro-uae2023',
    storageBucket: 'fajer-pro-uae2023.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCb2SlDpUwoVCXU9X9YI3IWubyxDpRJb9g',
    appId: '1:675234341647:ios:866cd7e676da31d26e947a',
    messagingSenderId: '675234341647',
    projectId: 'fajer-pro-uae2023',
    storageBucket: 'fajer-pro-uae2023.appspot.com',
    iosClientId:
        '675234341647-omkqahsik18rmrht45p7qp8ke0f9897o.apps.googleusercontent.com',
    iosBundleId: 'com.fajer.fajer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCb2SlDpUwoVCXU9X9YI3IWubyxDpRJb9g',
    appId: '1:675234341647:ios:cef5000e195d01b56e947a',
    messagingSenderId: '675234341647',
    projectId: 'fajer-pro-uae2023',
    storageBucket: 'fajer-pro-uae2023.appspot.com',
    iosClientId:
        '675234341647-2qng3l005soan6nrkqmn7562leqjdn6b.apps.googleusercontent.com',
    iosBundleId: 'com.fajer.fajer.RunnerTests',
  );
}
