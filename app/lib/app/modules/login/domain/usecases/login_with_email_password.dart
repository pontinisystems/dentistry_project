import 'package:app/app/modules/login/domain/entities/LoggedUserInfo.dart';
import 'package:app/app/modules/login/domain/entities/login_credential.dart';
import 'package:app/app/modules/login/domain/errors/errors.dart';
import 'package:app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
abstract class LoginWithEmail {
  Future<Either<Failure, LoggedUserInfo>> call(LoginCredential loginCredential);
}

class LoginWithEmailImplImpl implements LoginWithEmail {
  final LoginRepository repository;

  LoginWithEmailImplImpl(this.repository);



  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {

    if (!credential.isValidEmail) {
      return Left(ErrorLoginEmail(message: "Invalid E-mail"));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginEmail(message: "Invalid Password"));
    }

    var result= await repository.loginEmail(
      email: credential.email,
      password: credential.password,
    );

    return result;


  }
}
