import 'package:dartz/dartz.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/core/utils/strings.dart';
import 'package:dentistry/dentistry.dart';
import 'package:dentistry/modules/appointment/domain/entities/statistic_appointment.dart';
import 'package:dentistry/modules/appointment/domain/repositories/appointment_repository.dart';
import 'package:dentistry/modules/appointment/infra/datasources/appointment_data_source.dart';
import 'package:dentistry/modules/appointment/presentation/model/statistic_appointment_filter.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: AppointmentRepository)
class AppointmentRepositoryImpl implements AppointmentRepository {

  AppointmentRepositoryImpl(this.dataSource);

  final AppointmentDataSource dataSource;

  @override
  Future<Either<Failure, StatisticAppointment>> getStatisticByFilter(StatisticAppointmentFilter statisticAppointmentFilter) async{
    try {
      final statistic = await dataSource.getStatisticByFilter(statisticAppointmentFilter);
      return right(statistic);
    }
    on DatabaseException catch (databaseException) {
      return left(databaseException);
    }
    catch (e) {
      return left(UnexpectedError(unexpectedFailure));
    }
  }

}
