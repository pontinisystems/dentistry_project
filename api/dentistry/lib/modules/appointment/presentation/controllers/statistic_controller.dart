import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/modules/appointment/domain/usecases/get_statistic_appointment_by_filter.dart';
import 'package:dentistry/modules/appointment/presentation/model/statistic_appointment_filter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class StatisticAppointmentController extends ResourceController {
  StatisticAppointmentController(this._useCase);

  final GetStatisticAppointmentByFilter _useCase;

  @Operation.get()
  Future<Response> staticByFilter(@Bind.body() StatisticAppointmentFilter filter ) async {





  }










}
