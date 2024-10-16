import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signupWithEmailAndpassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Te error is $e");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Te error is $e");
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("User signed out successfully");
    } catch (e) {
      print("Error signing out: $e");
      // Handle error as needed, possibly throw it to handle in the UI
    }
  }
}
