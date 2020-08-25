import 'package:app/app/core/pages/loading_dialog.dart';
import 'package:app/app/core/stores/auth_store.dart';
import 'package:app/app/core/util/message.dart';
import 'package:app/app/core/util/store_state.dart';
import 'package:app/app/core/util/store_utils.dart';
import 'package:app/app/modules/login/domain/usecases/login_with_email_password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'domain/entities/LoggedUserInfo.dart';
import 'domain/entities/login_credential.dart';
import 'domain/errors/errors.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithEmail login;
  final LoadingDialog loading;
  final AuthStore authStore;

  @observable
  bool enable=false;

  @observable
  bool buttonLoading;

  @observable
  Message errorMessage = Message();



  _LoginControllerBase(this.login, this.loading, this.authStore);

  @observable
  String email = "";

  @action
  setEmail(String value) => this.email = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => this.password = value;

  @observable
  LoggedUserInfo loginSuccess;

  @computed
  LoginCredential get credential =>LoginCredential(email: email, password: password);

  requestLogin() async {
    loading.show();
    await Future.delayed(Duration(seconds: 1));
    var result = await login(credential);
    await loading.hide();
    result.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message)));
    }, (user) {
      authStore.setUser(user.token);
      Modular.to.popUntil(ModalRoute.withName(Modular.link.modulePath));
      Modular.to.pop();
    });


  }


}
