import 'package:dartz/dartz.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/modules/appointment/domain/entities/statistic_appointment.dart';
import 'package:dentistry/modules/appointment/domain/repositories/appointment_repository.dart';
import 'package:dentistry/modules/appointment/presentation/model/statistic_appointment_filter.dart';
import 'package:injectable/injectable.dart';
mixin GetStatisticAppointmentByFilter {
  Future<Either<Failure, StatisticAppointment>> call(StatisticAppointmentFilter filter);
}


@LazySingleton(as: GetStatisticAppointmentByFilter)
class GetStatisticAppointmentByFilterImpl implements GetStatisticAppointmentByFilter {
  GetStatisticAppointmentByFilterImpl(this.repository);

  final AppointmentRepository repository;

  @override
  Future<Either<Failure, StatisticAppointment>> call(StatisticAppointmentFilter filter) async {
    filter.validate().fold((failure) {
      return failure;
    }, (validated) {
      return validated;
    });

    return repository.getStatisticByFilter(filter);

  }


}



