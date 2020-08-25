import 'package:dentistry/modules/appointment/domain/entities/statistic_appointment.dart';
import 'package:dentistry/modules/appointment/presentation/model/statistic_appointment_filter.dart';

abstract class AppointmentDataSource{
  Future<StatisticAppointment> getStatisticByFilter(StatisticAppointmentFilter filter);
}

