// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dentistry/modules/user/external/user_access_data_source_impl.dart';
import 'package:dentistry/modules/user/infra/datasources/user_access_data_source.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/modules/user/infra/repositories/user_repository_impl.dart';
import 'package:dentistry/dentistry.dart';
import 'package:dentistry/modules/user/domain/usecases/find_user_access.dart';
import 'package:dentistry/modules/user/domain/repositories/user_repository.dart';
import 'package:dentistry/core/controller/jwt_authentication_controller.dart';
import 'package:dentistry/modules/user/domain/usecases/login_with_mail_and_password.dart';
import 'package:dentistry/modules/user/presentation/controllers/check_login_and_password_controller.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<UserAccessDataSource>(
      () => UserAccessDataSourceImpl(g<ManagedContext>()));
  g.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(g<UserAccessDataSource>()));
  g.registerLazySingleton<FindUserAccess>(
      () => FindUserAccessImpl(g<UserRepository>()));
  g.registerLazySingleton<JWTAuthenticationController>(
      () => JWTAuthenticationController(g<FindUserAccess>()));
  g.registerLazySingleton<LoginWithMailAndPassword>(
      () => LoginWithMailAndPasswordImpl(g<UserRepository>()));
  g.registerLazySingleton<CheckLoginAndPasswordController>(
      () => CheckLoginAndPasswordController(g<LoginWithMailAndPassword>()));
}
