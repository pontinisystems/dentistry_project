import 'package:flutter/material.dart';
import 'package:app/app/core/util/string_extension.dart';

class LoginCredential {
  final String email;
  final String password;


  LoginCredential(
      { this.email, this.password});

  bool get isValidEmail => email.iSNotNullAndIsNotEmpty() ;
  bool get isValidPassword =>
      password.iSNotNullAndIsNotEmpty() && password.length > 3;




}
