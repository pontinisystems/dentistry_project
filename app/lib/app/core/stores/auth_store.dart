import 'package:app/app/modules/login/domain/entities/LoggedUserInfo.dart';
import 'package:app/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:app/app/modules/login/domain/usecases/logout.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final GetLoggedUser getLoggedUser;
  final Logout logout;
  _AuthStoreBase(this.getLoggedUser, this.logout){
    checkLogin();
  }

  @observable
  String token;

  @computed
  bool get isLogged => token != null && token.isNotEmpty;

  @action
  void setUser(String value) => token = value;

  Future<bool> checkLogin() async {
    var result = await getLoggedUser();
    return result.fold((l) => null, (user) {
      setUser(user);
      return true;
    });
  }

  Future signOut() async {
/*    var result = await logout();
    result.fold((l) {
      asuka.showSnackBar(SnackBar(content: Text(l.message)));
    }, (r) {
      setUser(null);
    });*/
  }
}
