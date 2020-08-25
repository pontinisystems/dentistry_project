import 'dart:async';


import 'package:app/app/modules/login/domain/entities/LoggedUserInfo.dart';

import '../../infra/datasources/login_datasource.dart';


class LoginDataSourceImpl implements LoginDataSource {

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<LoggedUserInfo> currentUser() async  {
  return await  LoggedUserInfo(email: "",name: "",phoneNumber: "");
  }



}
