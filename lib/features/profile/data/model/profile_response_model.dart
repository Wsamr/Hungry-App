import 'package:restaurant_app_sonic/features/profile/data/model/profile_data_model.dart';

class ProfileResponseModel {
  final int code;
  final String message;
  final ProfileDataModel profileDataModel;
  ProfileResponseModel({
    required this.code,
    required this.message,
    required this.profileDataModel,
  });

  factory ProfileResponseModel.fromMap(Map<String, dynamic> map) {
    return ProfileResponseModel(
      code: map['code'] as int,
      message: map['message'] as String,
      profileDataModel: ProfileDataModel.fromMap(
        map['data'] as Map<String, dynamic>,
      ),
    );
  }
}
