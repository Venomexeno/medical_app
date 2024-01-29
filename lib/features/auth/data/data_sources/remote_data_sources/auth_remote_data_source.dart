import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/features/auth/data/models/sign_in_model.dart';
import 'package:medical_app/features/auth/data/models/sign_up_model.dart';
import 'package:medical_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:medical_app/features/auth/domain/entities/sign_up_entity.dart';

// import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_in_use_case.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_up_use_case.dart';

abstract class AuthRemoteDataSource {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<SignInEntity> signInWithEmailAndPassword(SignInParameters parameters);

  Future<SignUpEntity> signUp(SignUpParameters parameters);

// Future<UserCredential?> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//       return await _firebaseAuth.signInWithCredential(credential);
//     }
//   } catch (e) {
//     return null;
//   }
// }
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<SignInEntity> signInWithEmailAndPassword(
      SignInParameters parameters) async {
    final user = await _firebaseAuth.signInWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );
    final snapShot = await _firebaseFireStore
        .collection('users')
        .where('uid', isEqualTo: user.user!.uid)
        .get();
    final userData = snapShot.docs.map((e) => SignInModel.fromFirebaseUser(e)).single;
    return userData;
  }

  @override
  Future<SignUpEntity> signUp(SignUpParameters parameters) async {
    final response = await _firebaseAuth.createUserWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );
    _createNewUserInFireStore(email: parameters.email, name: parameters.name);
    return SignUpModel.fromFirebaseUser(response.user!);
  }

  void _createNewUserInFireStore({
    required String name,
    required String email,
  }) {
    final String uid = currentUser!.uid;
    final CollectionReference<Map<String, dynamic>> usersRef =
        FirebaseFirestore.instance.collection('users');
    usersRef.doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
    });
  }
}
