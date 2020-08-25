
import 'package:app/app/modules/login/domain/entities/LoggedUserInfo.dart';
import 'package:app/app/modules/login/domain/errors/errors.dart';
import 'package:app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';

/*
part 'get_logged_user.g.dart';
*/

/*abstract class GetLoggedUser {
  Future<Either<Failure, LoggedUserInfo>> call();
}*/

abstract class GetLoggedUser {
  Future<Either<Failure, String>> call();
}

@Injectable(singleton: false)
class GetLoggedUserImpl implements GetLoggedUser {
  final LoginRepository repository;

  GetLoggedUserImpl(this.repository);

/*  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await repository.loggedUser();
  }*/

  @override
  Future<Either<Failure, String>> call() async {
    return await repository.getToken();
  }
}
