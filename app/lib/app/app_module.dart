import 'package:app/app/core/pages/loading_dialog.dart';
import 'package:app/app/core/pages/spash_screen_page.dart';
import 'package:app/app/core/stores/auth_store.dart';
import 'package:app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:app/app/modules/login/domain/usecases/logout.dart';
import 'package:app/app/modules/login/external/datasources/login_data_source_impl.dart';
import 'package:app/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:app/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:app/app/modules/login/login_module.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'modules/login/domain/usecases/get_logged_user.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => LoadingDialogImpl()),
    Bind((i) => LoginDataSourceImpl()),
    Bind((i) => LoginRepositoryImpl(i.get(),)),
    Bind((i) => LogoutImpl(i.get(),)),
    Bind((i) => GetLoggedUserImpl(i.get(),)),
    Bind((i) => AuthStore(i.get(), i.get())),
  ];

  @override
  List<Router> get routers => [
    Router("/", child: (_, __) => SplashScreenPage()),
    Router('/login', module: LoginModule()),
    Router("/home", child: (_, __) => SplashScreenPage()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
