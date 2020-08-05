import 'package:flutter/material.dart';

class User {
  final String email;
  final String fullName;
  final String mobile;
  final DateTime expiryDate;
  final String token;

  User({
    @required this.email, 
    @required this.fullName,
    @required this.mobile,
    @required this.expiryDate,
    @required this.token
    });
}
