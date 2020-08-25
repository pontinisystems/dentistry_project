import 'dart:async';

import 'package:app/app/modules/login/domain/entities/LoggedUserInfo.dart';


abstract class LoginDataSource {
/*  Future<UserModel> loginPhone({String phone});
  Future<UserModel> loginEmail({String email, String password});
  Future<UserModel> validateCode({String verificationId, String code});

  Future<UserModel> currentUser();*/

  Future<LoggedUserInfo> currentUser();
  Future<void> logout();
}
