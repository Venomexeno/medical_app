import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? uid,
    final String? name,
    final String? email,
    final String? password,
  }) : super(
          uid: uid,
          name: name,
          email: email,
          password: password,
        );

  factory UserModel.fromSnapShot(DocumentSnapshot snapshot) {
    return UserModel(
      uid: snapshot.get('uid'),
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      password: snapshot.get('password'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "password": password,
    };
  }
}
