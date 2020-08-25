import 'package:app/app/modules/login/domain/entities/LoggedUserInfo.dart';
import 'package:app/app/modules/login/domain/entities/login_credential.dart';
import 'package:app/app/modules/login/domain/errors/errors.dart';
import 'package:app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:app/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {String email, String password}) async {
   /* try {
      var user = await dataSource.loginEmail(email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(ErrorLoginEmail(message: "Error login with Email"));
    }*/
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loginPhone({String phone}) async {
    /*try {
      var user = await dataSource.loginPhone(phone: phone);
      return Right(user);
    } on NotAutomaticRetrieved catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ErrorLoginPhone(message: "Error login with Phone"));
    }*/
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> verifyPhoneCode(
      {String verificationId, String code}) async {
  /*  try {
      var user = await dataSource.validateCode(
          verificationId: verificationId, code: code);
      return Right(user);
    } catch (e) {
      return Left(ErrorLoginPhone(message: "Error login with Phone"));
    }*/
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try {
      var user = await dataSource.currentUser();
      return Right(user);
    } catch (e) {
      return Left(ErrorGetLoggedUser(
          message: "Error ao tentar recuperar usuario atual logado"));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return right(unit);
    } catch (e) {
      return Left(ErrorLogout(message: "Error ao tentar fazer logout"));
    }
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if(token!=null && token.isNotEmpty){
      return right(token);
    }else{
      return left(ErrorToken(message: "token não encontrado"));
    }
  }

  @override
  Future<Either<Failure, bool>> isLogged() {
    // TODO: implement isLogged
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> login(LoginCredential loginCredential) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
