import 'package:dartz/dartz.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/modules/appointment/domain/entities/statistic_appointment.dart';
import 'package:dentistry/modules/appointment/presentation/model/statistic_appointment_filter.dart';


abstract class AppointmentRepository {
  Future<Either<Failure, StatisticAppointment>> getStatisticByFilter(StatisticAppointmentFilter statisticAppointmentFilter);
}
