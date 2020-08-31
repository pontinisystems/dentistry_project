import 'package:dartz/dartz.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/core/utils/strings.dart';
import 'package:dentistry/dentistry.dart';
import 'package:dentistry/modules/user/domain/entities/user_acess.dart';
import 'package:dentistry/modules/user/domain/errors/erros.dart';
import 'package:dentistry/modules/user/domain/repositories/user_repository.dart';
import 'package:dentistry/modules/user/infra/datasources/user_access_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/user_repository.dart';


@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.dataSource);

  final UserAccessDataSource dataSource;

  @override
  Future<Either<Failure, UserAccess>> findUserAccess(int id)async {
    try {
      final user = await dataSource.findUserAccessById(id);
      if(user==null){
        return left(EntityNotFound(entityNotFound));
      }
      return right(const UserAccess(id: 10,login: "pontinisystems",password: "123123123"));
    }
    on DatabaseException catch (databaseException) {
      return left(databaseException);
    }
    catch (e) {
      return left(UnexpectedError(unexpectedFailure));
    }
  }



  @override
  Future<Either<Failure, UserAccess>> recoverUserByLoginPassword(
      String login, String password) async {
    try {
     final user = await dataSource.recoverUserByLoginPassword(login, password);
     if(user==null){
       return left(EntityNotFound(entityNotFound));
     }
      return right(const UserAccess(id: 10,login: "pontinisystems",password: "123123123"));
    }
    on DatabaseException catch (databaseException) {
      return left(databaseException);
    }
    catch (e) {
      return left(UnexpectedError(unexpectedFailure));
    }
  }
}
