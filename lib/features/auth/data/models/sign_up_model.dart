import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/features/auth/domain/entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  final String uid;
  final String email;
  final String? name;

  SignUpModel({required this.uid, required this.email, this.name})
      : super(
          uidEntity: uid,
          emailEntity: email,
          nameEntity: name,
        );

  factory SignUpModel.fromFirebaseUser(User user) => SignUpModel(
      uid: user.uid,
      email: user.email!,
    );
}
