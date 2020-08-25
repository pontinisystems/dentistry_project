import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/modules/appointment/domain/entities/statistic_appointment.dart';
import 'package:dentistry/modules/appointment/infra/datasources/appointment_data_source.dart';
import 'package:dentistry/modules/appointment/infra/models/appointment_model.dart';
import 'package:dentistry/modules/appointment/presentation/model/statistic_appointment_filter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppointmentDataSource)
class AppointmentDataSourceImpl implements AppointmentDataSource {
  AppointmentDataSourceImpl(this.context);

  final ManagedContext context;

  @override
  Future<StatisticAppointment> getStatisticByFilter(StatisticAppointmentFilter filter) async {
    try {
      final queryMarked = Query<AppointmentModel>(context)
        ..where((appointment) => appointment.date.isAfter(filter.initDate) && appointment.date.isBefore(filter.finalDate));
      final marked = await queryMarked.reduce.count();

      final queryCanceled = Query<AppointmentModel>(context)
        ..where((appointment) => appointment.date.isBefore(filter.initDate) && appointment.date.isBefore(filter.finalDate));
      final canceled = await queryCanceled.reduce.count();


      final queryToday = Query<AppointmentModel>(context)
        ..where((appointment) => appointment.date.isBefore(filter.initDate) && appointment.date.isBefore(filter.finalDate));
      final today = await queryToday.reduce.count();


      return StatisticAppointment(today: today,marked: marked,canceled: canceled);
    } catch (e, s) {
      throw DatabaseException('Ocorreu um erro ao recuperar statistic');
    }
  }


}
