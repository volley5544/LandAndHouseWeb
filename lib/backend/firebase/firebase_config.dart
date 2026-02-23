import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDxr8jEJjig1asdwWEjix6HxPgFOQimlSE",
            authDomain: "srisawad-mobile-app-prd.firebaseapp.com",
            projectId: "srisawad-mobile-app-prd",
            storageBucket: "srisawad-mobile-app-prd.appspot.com",
            messagingSenderId: "194304903534",
            appId: "1:194304903534:web:80ad028358709a81a3997f",
            measurementId: "G-Y2XW6PP199"));
  } else {
    await Firebase.initializeApp();
  }
}
