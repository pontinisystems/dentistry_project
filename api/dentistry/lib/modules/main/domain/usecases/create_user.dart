import 'package:dartz/dartz.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/dentistry.dart';
import 'package:dentistry/modules/appointment/domain/entities/statistic_appointment.dart';
import 'package:dentistry/modules/appointment/domain/repositories/appointment_repository.dart';
import 'package:dentistry/modules/appointment/presentation/model/statistic_appointment_filter.dart';
import 'file:///C:/workspace/dentistry_project/api/dentistry/lib/modules/main/presentation/model/config.dart';
import 'package:dentistry/modules/main/domain/errors/erros.dart';
import 'package:injectable/injectable.dart';
mixin CreateUser {
  Future<Either<Failure, bool>> call( Config config);
}


@LazySingleton(as: CreateUser)
class CreateUserImpl implements CreateUser {
  CreateUserImpl(this.context);

  final ManagedContext context;

  @override
  Future<Either<Failure, bool>> call(Config config) async {
    if(config==null){
      return left(InvalidConfig("As informações de configurações não são valida"));
    }

    if(config.isPopulateData){

      // Dropar as tabelas

      // Criar banco de dados

      // Criar os registros


    }
    


  }


}



