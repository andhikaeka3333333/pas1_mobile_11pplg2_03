// model/ProfileResponseModel.dart
class ProfileResponseModel {
  bool status;
  String message;
  ProfileData? data;

  ProfileResponseModel(
      {required this.status, required this.message, this.data});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? ProfileData.fromJson(json['data']) : null,
    );
  }
}

class ProfileData {
  String full_name;
  String email;
  String username;

  ProfileData(
      {required this.full_name, required this.email, required this.username});

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      full_name: json['full_name'],
      email: json['email'],
      username: json['username'],
    );
  }
}
