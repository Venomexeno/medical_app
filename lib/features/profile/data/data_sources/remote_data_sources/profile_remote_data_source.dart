import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/profile/data/models/profile_info_model.dart';
import 'package:medical_app/features/profile/domain/entities/profle_info_entity.dart';
import 'package:medical_app/features/profile/domain/use_cases/fetch_porfile_info_use_case.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileInfoEntity> fetchProfileInfo(
      FetchProfileInfoParameters parameters);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  @override
  Future<ProfileInfoEntity> fetchProfileInfo(
      FetchProfileInfoParameters parameters) async {
    final profileData =
        await firebaseFireStore.collection('users').doc(parameters.uid).get();

    return ProfileInfoModel.fromFirebaseUser(profileData);
  }
}
