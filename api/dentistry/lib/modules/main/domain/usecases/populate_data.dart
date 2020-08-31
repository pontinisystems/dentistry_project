import 'package:dartz/dartz.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/dentistry.dart';
import 'package:dentistry/modules/appointment/domain/entities/statistic_appointment.dart';
import 'package:dentistry/modules/appointment/domain/repositories/appointment_repository.dart';
import 'package:dentistry/modules/appointment/presentation/model/statistic_appointment_filter.dart';
import 'file:///C:/workspace/dentistry_project/api/dentistry/lib/modules/main/presentation/model/config.dart';
import 'package:dentistry/modules/main/domain/errors/erros.dart';
import 'package:dentistry/modules/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';
mixin PopulateData {
  Future<Either<Failure, bool>> call( Config config);
}


@LazySingleton(as: PopulateData)
class PopulateDataImplImpl implements PopulateData {
  PopulateDataImplImpl(this.context, this.repository);

  final ManagedContext context;
  final UserRepository repository;

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



