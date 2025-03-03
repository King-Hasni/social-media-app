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
    apiKey: 'AIzaSyDaR31Wc_QzrIHxtoX0B3O1aJ7LaZL0LnQ',
    appId: '1:526717018202:android:7fb51f8272646c99eab863',
    messagingSenderId: '526717018202',
    projectId: 'instagram-clone-34eeb',
    storageBucket: 'instagram-clone-34eeb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgoLlJm47S-SOH3IgESnQqaKt89CK_HPQ',
    appId: '1:526717018202:ios:4bfe60b55b2e2076eab863',
    messagingSenderId: '526717018202',
    projectId: 'instagram-clone-34eeb',
    storageBucket: 'instagram-clone-34eeb.firebasestorage.app',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgoLlJm47S-SOH3IgESnQqaKt89CK_HPQ',
    appId: '1:526717018202:ios:4bfe60b55b2e2076eab863',
    messagingSenderId: '526717018202',
    projectId: 'instagram-clone-34eeb',
    storageBucket: 'instagram-clone-34eeb.firebasestorage.app',
    iosBundleId: 'com.example.socialMedia',
  );

}