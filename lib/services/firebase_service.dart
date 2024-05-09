import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithCredential(AuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
    } catch (e) {
      if (kDebugMode) {
        print("Error signing in with credential: $e");
      }
    }
  }
}
