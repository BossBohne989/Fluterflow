import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAgt7ENoAJ11d7jBebZh6-iLbqd6xduYMw",
            authDomain: "wto-negotiation-game.firebaseapp.com",
            projectId: "wto-negotiation-game",
            storageBucket: "wto-negotiation-game.appspot.com",
            messagingSenderId: "447768866463",
            appId: "1:447768866463:web:d82a9be9b616c9ba817caa"));
  } else {
    await Firebase.initializeApp();
  }
}
