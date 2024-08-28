import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topluluk_proje/models/user_model.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance));

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;

  AuthRepository({required this.auth, required this.firebaseFirestore});

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> storeUserInfoToFirebase(UserModel userModel) async {
    userModel.profilePhoto ??=
        "https://w7.pngwing.com/pngs/178/595/png-transparent-user-profile-computer-icons-login-user-avatars-thumbnail.png";

    userModel.uid = auth.currentUser!.uid;

    await firebaseFirestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .set(userModel.toMap());
  }
}
