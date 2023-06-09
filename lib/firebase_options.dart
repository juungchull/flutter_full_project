// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


// ...


/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
///
///

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
    apiKey: 'AIzaSyCyPVHHxZmZVVVypfkNgzII9AVh1FkzDTQ',
    appId: '1:1093370120045:web:f29c9bffd4c512fc783c64',
    messagingSenderId: '1093370120045',
    projectId: 'flutter-first-admin',
    authDomain: 'flutter-first-admin.firebaseapp.com',
    storageBucket: 'flutter-first-admin.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqdrowER6zigxNIR4gBY1NdYINRmHkIeY',
    appId: '1:1093370120045:android:79497da6cf536149783c64',
    messagingSenderId: '1093370120045',
    projectId: 'flutter-first-admin',
    storageBucket: 'flutter-first-admin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGSrW7iPzN9W2RqmfpFT7z2cxjz1QCX1w',
    appId: '1:1093370120045:ios:751d18e73d8cf2b0783c64',
    messagingSenderId: '1093370120045',
    projectId: 'flutter-first-admin',
    storageBucket: 'flutter-first-admin.appspot.com',
    iosClientId: '1093370120045-gr0mpnv7heet7105u2em527h2jb42obo.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFullProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGSrW7iPzN9W2RqmfpFT7z2cxjz1QCX1w',
    appId: '1:1093370120045:ios:419389f69257bfe4783c64',
    messagingSenderId: '1093370120045',
    projectId: 'flutter-first-admin',
    storageBucket: 'flutter-first-admin.appspot.com',
    iosClientId: '1093370120045-2hhbtmf9kpg304iefn0nkj86haahh9k4.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFullProject.RunnerTests',
  );
}
