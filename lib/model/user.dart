import 'package:flutter/foundation.dart';

enum UserRole { yirauser, admin,super_admin}// Add other roles here }


class Login{
  bool? status;
  String? message;
  User? data;

  Login({this.status,this.message,this.data});

 factory Login.fromJson(Map<String,dynamic> json){
    return Login(
      status: json['status']??false,
      message: json['message']??'',
      data:json['data']!=null? User.fromJson(json['data']):null,
    );
  }
    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

}

class User {
  String? userId;
  UserRole? userRole;
  String? userName;
  String? organizationName;
  String? emailId;
  String? phoneNumber;
  String? phoneCode;
  String? profileImage;
  String? orgId;
  String? userAge;
  String? gender;
  String? userBMI;
  String? userHeight;
  String? userWeight;
  String? userHeightUnit;
  String? userWeightUnit;
  int? otherId;
  int? specializationSelectId;
  String? isEmailVerified;
  String? dateOfBirth;
  String? userAccessToken;
  String? userAccessTokenExpiration;
  String? consentType;
  double? lifeStyleScore;
  String? qrCode;
  String? refreshToken;
  String? refreshTokenExpiryTime;
  String? userSignature;
  List<Map<String, dynamic>>? configUserData;
  String? admissionNumber;
  String? timeZone;
  String? myAppointmenstUrl;

  User({
    this.userId,
    this.userRole,
    this.userName,
    this.organizationName,
    this.emailId,
    this.phoneNumber,
    this.phoneCode,
    this.profileImage,
    this.orgId,
    this.userAge,
    this.gender,
    this.userBMI,
    this.userHeight,
    this.userWeight,
    this.userHeightUnit,
    this.userWeightUnit,
    this.otherId,
    this.specializationSelectId,
    this.isEmailVerified,
    this.dateOfBirth,
    this.userAccessToken,
    this.userAccessTokenExpiration,
    this.consentType,
    this.lifeStyleScore,
    this.qrCode,
    this.refreshToken,
    this.refreshTokenExpiryTime,
    this.userSignature,
    this.configUserData,
    this.admissionNumber,
    this.timeZone,
    this.myAppointmenstUrl,
  });

factory User.fromJson(Map<String, dynamic> json) {
  return User(
    userId: json['userID'] ?? '',
    userRole: _parseUserRole(json['userRole']),
    userName: json['userName'] ?? '',
    organizationName: json['organizationName'] ?? '',
    emailId: json['emailId'] ?? '',
    phoneNumber: json['phoneNumber'] ?? '',
    phoneCode: json['phoneCode'] ?? '',
    profileImage: json['profileImage'] ?? '',
    orgId: json['orgId'] ?? '',
    userAge: json['userAge'] ?? '',
    gender: json['gender'] ?? '',
    userBMI: json['userBMI'] ?? '',
    userHeight: json['userHeight'] ?? '',
    userWeight: json['userWeight'] ?? '',
    userHeightUnit: json['userHeightUnit'] ?? '',
    userWeightUnit: json['userWeightUnit'] ?? '',
    otherId: json['otherId'],
    specializationSelectId: json['specializationSelectId'],
    isEmailVerified: json['isEmailVerified'] ?? '',
    dateOfBirth: json['dateOfBirth'] ?? '',
    userAccessToken: json['userAccessToken'] ?? '',
    userAccessTokenExpiration: json['userAccessTokenExpiration'] ?? '',
    consentType: json['consentType'] ?? '',
    lifeStyleScore: json['lifeStyleScore']??'',
    qrCode: json['qrCode'] ?? '',
    refreshToken: json['RefreshToken'] ?? '',
    refreshTokenExpiryTime: json['RefreshTokenExpiryTime'] ?? '',
    userSignature: json['UserSignature'] ?? '',
    configUserData: json['configUserData'] != null
        ? (json['configUserData'] as List<dynamic>)
            .map((item) => item as Map<String, dynamic>)
            .toList()
        : [],
    admissionNumber: json['AdmissionNumber'] ?? '',
    timeZone: json['TimeZone'] ?? '',
    myAppointmenstUrl: json['MyAppointmenstUrl'] ?? '',
  );
}
  static UserRole _parseUserRole(String? role) {
    switch (role) {
      case 'yirauser':
        return UserRole.yirauser;
      case 'admin':
        return UserRole.admin;
      case 'super_admin':
        return UserRole.super_admin;
      // Add other cases as needed
      default:
        return UserRole.yirauser; // Default to yirauser if the role is not recognized
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userRole': userRole?.toString().split('.').last,
      'userName': userName,
      'organizationName': organizationName,
      'emailId': emailId,
      'phoneNumber': phoneNumber,
      'phoneCode': phoneCode,
      'profileImage': profileImage,
      'orgId': orgId,
      'userAge': userAge,
      'gender': gender,
      'userBMI': userBMI,
      'userHeight': userHeight,
      'userWeight': userWeight,
      'userHeightUnit': userHeightUnit,
      'userWeightUnit': userWeightUnit,
      'otherId': otherId,
      'specializationSelectId': specializationSelectId,
      'isEmailVerified': isEmailVerified,
      'dateOfBirth': dateOfBirth,
      'userAccessToken': userAccessToken,
      'userAccessTokenExpiration': userAccessTokenExpiration,
      'consentType': consentType,
      'lifeStyleScore': lifeStyleScore,
      'qrCode': qrCode,
      'refreshToken': refreshToken,
      'refreshTokenExpiryTime': refreshTokenExpiryTime,
      'userSignature': userSignature,
      'configUserData': configUserData,
      'admissionNumber': admissionNumber,
      'timeZone': timeZone,
      'myAppointmenstUrl': myAppointmenstUrl,
    };
  }
}

