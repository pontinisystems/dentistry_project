import 'package:app/app/modules/login/domain/entities/LoggedUserInfo.dart';
import 'package:app/app/modules/login/domain/entities/login_credential.dart';
import 'package:app/app/modules/login/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {

  Future<Either<Failure, LoggedUserInfo>> loggedUser();
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure,bool>>isLogged();
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {String email, String password});
  Future<Either<Failure,String>>getToken();





}
