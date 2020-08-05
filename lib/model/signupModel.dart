import 'package:flutter/foundation.dart';

class SignUpModel {
  String email;
  String fullName;
  String password;
  String mobile;
  int countryId;
  int userType;

  SignUpModel(
      {@required this.email,
      @required this.fullName,
      @required this.password,
      this.mobile,
      this.countryId,
      this.userType});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'password': password,
      'mobile': mobile,
      'countryId': countryId,
      'userType': userType
    };
  }
}

class ResetModel {
  String email;

  ResetModel({this.email});

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}
