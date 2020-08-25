import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/core/model/message.dart';
import 'package:dentistry/core/utils/cryptography_util.dart';
import 'package:dentistry/core/utils/jwt_utils.dart';
import 'package:dentistry/core/utils/strings.dart';
import 'package:dentistry/modules/appointment/domain/usecases/get_statistic_appointment_by_filter.dart';
import 'package:dentistry/modules/appointment/presentation/model/statistic_appointment_filter.dart';
import 'package:dentistry/modules/user/domain/errors/erros.dart';
import 'package:dentistry/modules/user/domain/usecases/login_with_mail_and_password.dart';
import 'package:dentistry/modules/user/presentation/model/login_request.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class StatisticAppointmentController extends ResourceController {
  StatisticAppointmentController(this._useCase);

  final GetStatisticAppointmentByFilter _useCase;

  @Operation.get()
  Future<Response> staticByFilter(@Bind.body() StatisticAppointmentFilter filter ) async {





  }










}
