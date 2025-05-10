import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MyUser?> signIn(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final uid = result.user!.uid;
      final doc = await _firestore.collection('users').doc(uid).get();

      if (doc.exists) {
        return MyUser(email: doc['email'], role: doc['role']);
      }
    } catch (e) {
      print("Erreur de connexion : $e");
    }
    return null;
  }
}
