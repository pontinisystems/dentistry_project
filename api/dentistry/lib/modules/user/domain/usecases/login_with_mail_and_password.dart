import 'package:dartz/dartz.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/core/utils/cryptography_util.dart';
import 'package:dentistry/modules/user/domain/entities/user_acess.dart';
import 'package:dentistry/modules/user/domain/errors/erros.dart';
import 'package:dentistry/modules/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';
mixin LoginWithMailAndPassword {
  Future<Either<Failure, UserAccess>> call(String login, String password);
}


@LazySingleton(as: LoginWithMailAndPassword)
class LoginWithMailAndPasswordImpl implements LoginWithMailAndPassword {
  LoginWithMailAndPasswordImpl(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, UserAccess>> call(String login, String password) async {

    if (login == null ||
        login.isEmpty ||
        password == null ||
        password.isEmpty) {
      return left(EmptyLoginOrPassword("Login ou senha incorreto"));
    }
    final String passwordEncrypts = Cryptography.encryptPassword(password);

    return await repository.recoverUserByLoginPassword(login, passwordEncrypts);

  }


}



