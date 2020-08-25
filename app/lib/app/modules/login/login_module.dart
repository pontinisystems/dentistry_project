import 'package:app/app/core/pages/loading_dialog.dart';
import 'package:app/app/core/stores/auth_store.dart';
import 'package:app/app/modules/login/infra/repositories/login_repository_impl.dart';

import 'domain/repositories/login_repository.dart';
import 'domain/usecases/login_with_email_password.dart';
import 'infra/datasources/login_datasource.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {


  @override
  List<Bind> get binds => [
    Bind((i) => LoginWithEmailImplImpl(i.get<LoginRepository>())),
    Bind((i) => LoginRepositoryImpl(i.get<LoginDataSource>(),)),
    Bind((i) => LoginController(i.get<LoginWithEmail>(),i.get<LoadingDialog>(),i.get<AuthStore>() )),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
