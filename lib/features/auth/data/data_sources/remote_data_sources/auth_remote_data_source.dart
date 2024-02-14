import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical_app/features/auth/data/models/sign_in_model.dart';
import 'package:medical_app/features/auth/data/models/sign_up_model.dart';
import 'package:medical_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:medical_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_in_use_case.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_up_use_case.dart';

abstract class AuthRemoteDataSource {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<SignInEntity> signInWithEmailAndPassword(SignInParameters parameters);

  Future<SignUpEntity> signUp(SignUpParameters parameters);

  Future<Unit> logOut();

  Future<SignInEntity> signInWithGoogle();
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
    final userData =
        await _firebaseFireStore.collection('users').doc(user.user!.uid).get();
    return SignInModel.fromFirebaseUser(userData);
  }

  @override
  Future<SignInEntity> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();

    final googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    await _createNewUserInFireStore(
      name: userCredential.user!.displayName!,
      email: userCredential.user!.email!,
    );
    final userData = await _firebaseFireStore
        .collection('users')
        .doc(userCredential.user!.uid)
        .get();

    return SignInModel.fromFirebaseUser(userData);
  }

  @override
  Future<Unit> logOut() async {
    await FirebaseAuth.instance.signOut();
    return unit;
  }

  @override
  Future<SignUpEntity> signUp(SignUpParameters parameters) async {
    final response = await _firebaseAuth.createUserWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );
    await _createNewUserInFireStore(email: parameters.email, name: parameters.name);
    return SignUpModel.fromFirebaseUser(response.user!);
  }

  Future<void> _createNewUserInFireStore({
    required String name,
    required String email,
  }) async {
    final String uid = currentUser!.uid;
    final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
    final userData = await userRef.get();
    if (!userData.exists) {
      final CollectionReference<Map<String, dynamic>> usersRef =
          FirebaseFirestore.instance.collection('users');
      usersRef.doc(uid).set({
        'imageUrl': '',
        'uid': uid,
        'name': name,
        'email': email,
      });
    }
  }
}
