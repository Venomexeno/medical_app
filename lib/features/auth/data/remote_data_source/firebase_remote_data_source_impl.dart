import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/auth/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:medical_app/features/auth/data/remote_data_source/models/user_model.dart';
import 'package:medical_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  FirebaseRemoteDataSourceImpl(
      {required this.fireStore,
      required this.auth,
      required this.googleSignIn});

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollection = fireStore.collection('users');

    final uid = await getCurrentUserId();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        uid: uid,
        name: user.name,
        email: user.email,
        password: user.password,
      ).toDocument();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUserId() async => auth.currentUser!.uid;

  @override
  Future<void> getUpdateUser(UserEntity user) {
    // TODO: implement getUpdateUser
    throw UnimplementedError();
  }

  @override
  Future<void> googleAuth() {
    // TODO: implement googleAuth
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity user) async {
    await auth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> signOut() async => await auth.signOut();

  @override
  Future<void> signUp(UserEntity user) async {
    await auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }
}
