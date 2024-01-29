import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/auth/domain/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  final String uid;
  final String email;
  final String name;

  SignInModel({required this.uid, required this.email, required this.name})
      : super(
          uidEntity: uid,
          emailEntity: email,
          nameEntity: name,
        );

  factory SignInModel.fromFirebaseUser(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      SignInModel(
          uid: document.data()!['uid'],
          email: document.data()!['email'],
          name: document.data()!['name']);
}
