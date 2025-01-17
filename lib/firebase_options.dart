
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyAWyanBUDJMj2VCQE0CfPZ8y0NGpcOdIVo',
    appId: '1:869948971507:web:c2de3ec0c0f56c37a0da86',
    messagingSenderId: '869948971507',
    projectId: 'prueba-7a20d',
    authDomain: 'prueba-7a20d.firebaseapp.com',
    databaseURL: 'https://prueba-7a20d-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-7a20d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC48ukkKseKN15PwbN9OEfm41D01zNpTJk',
    appId: '1:869948971507:android:beb2b3b98445cb87a0da86',
    messagingSenderId: '869948971507',
    projectId: 'prueba-7a20d',
    databaseURL: 'https://prueba-7a20d-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-7a20d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAV8vMSwZqYYcc_EC6roLnsGF8XLKifiHA',
    appId: '1:869948971507:ios:486bc664a2064291a0da86',
    messagingSenderId: '869948971507',
    projectId: 'prueba-7a20d',
    databaseURL: 'https://prueba-7a20d-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-7a20d.appspot.com',
    iosBundleId: 'com.example.taller',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAV8vMSwZqYYcc_EC6roLnsGF8XLKifiHA',
    appId: '1:869948971507:ios:486bc664a2064291a0da86',
    messagingSenderId: '869948971507',
    projectId: 'prueba-7a20d',
    databaseURL: 'https://prueba-7a20d-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-7a20d.appspot.com',
    iosBundleId: 'com.example.taller',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAWyanBUDJMj2VCQE0CfPZ8y0NGpcOdIVo',
    appId: '1:869948971507:web:10b21e8f8ff4c033a0da86',
    messagingSenderId: '869948971507',
    projectId: 'prueba-7a20d',
    authDomain: 'prueba-7a20d.firebaseapp.com',
    databaseURL: 'https://prueba-7a20d-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-7a20d.appspot.com',
  );
}
