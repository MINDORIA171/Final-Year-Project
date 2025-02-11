import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBv409rQ0J0YNvOrXKtMbzp0t0XH_t_Ei4",
            authDomain: "mindoria-31.firebaseapp.com",
            projectId: "mindoria-31",
            storageBucket: "mindoria-31.firebasestorage.app",
            messagingSenderId: "935924745280",
            appId: "1:935924745280:web:495ea0f920fb6930a24ba5"));
  } else {
    await Firebase.initializeApp();
  }
}
