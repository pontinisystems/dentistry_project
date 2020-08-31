import 'package:dartz/dartz.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/modules/user/domain/entities/user_acess.dart';


abstract class UserRepository {
  Future<Either<Failure, UserAccess>> recoverUserByLoginPassword(String login , String password);
  Future<Either<Failure, UserAccess>> findUserAccess(int id);

}
