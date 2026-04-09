import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDirjqI3As_IKFrBuJYYFiV2JGuiOschXA",
            authDomain: "srisawad-mobile-app-qa-360402.firebaseapp.com",
            projectId: "srisawad-mobile-app-qa-360402",
            storageBucket: "srisawad-mobile-app-qa-360402.appspot.com",
            messagingSenderId: "999302187733",
            appId: "1:999302187733:web:143bc4ad21aaed8367305c",
            measurementId: "G-7MZYJGJPV2"));
  } else {
    await Firebase.initializeApp();
  }
}
