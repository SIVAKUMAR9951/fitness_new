// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  bool success;
  int code;
  String message;
  Data data;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.user,
  });

  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.dob,
    this.gender,
    this.mobileOtp,
    this.emailVerifiedAt,
    this.profilePhotoPath,
    this.loginType,
    this.socialMediaId,
    required this.type,
    required this.status,
    this.deviceType,
    this.deviceId,
    required this.createdAt,
    required this.updatedAt,
    this.image,
  });

  int id;
  String firstName;
  String lastName;
  String name;
  String email;
  String mobileNo;
  DateTime dob;
  dynamic gender;
  dynamic mobileOtp;
  dynamic emailVerifiedAt;
  dynamic profilePhotoPath;
  dynamic loginType;
  dynamic socialMediaId;
  String type;
  String status;
  dynamic deviceType;
  dynamic deviceId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        email: json["email"],
        mobileNo: json["mobile_no"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        mobileOtp: json["mobile_otp"],
        emailVerifiedAt: json["email_verified_at"],
        profilePhotoPath: json["profile_photo_path"],
        loginType: json["login_type"],
        socialMediaId: json["social_media_id"],
        type: json["type"],
        status: json["status"],
        deviceType: json["device_type"],
        deviceId: json["device_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "email": email,
        "mobile_no": mobileNo,
        "dob": dob.toIso8601String(),
        "gender": gender,
        "mobile_otp": mobileOtp,
        "email_verified_at": emailVerifiedAt,
        "profile_photo_path": profilePhotoPath,
        "login_type": loginType,
        "social_media_id": socialMediaId,
        "type": type,
        "status": status,
        "device_type": deviceType,
        "device_id": deviceId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
      };
}
