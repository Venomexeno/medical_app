import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/auth/domain/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  final String uid;

  SignInModel({
    required this.uid,
  }) : super(
          uidEntity: uid,
        );

  factory SignInModel.fromFirebaseUser(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      SignInModel(
        uid: document.data()!['uid'],
      );
}
