import 'package:dartz/dartz.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/modules/user/domain/entities/user_acess.dart';
import 'package:dentistry/modules/user/domain/errors/erros.dart';
import 'package:dentistry/modules/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';
mixin FindUserAccess {
  Future<Either<Failure, UserAccess>> call(int user);
}


@LazySingleton(as: FindUserAccess)
class FindUserAccessImpl implements FindUserAccess {
  FindUserAccessImpl(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, UserAccess>> call(int user) async {
    if (user == null || user == 0) {
      return left(UserNotFound(""));
    }
    return await repository.findUserAccess(user);

  }


}



