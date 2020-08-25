import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/modules/user/domain/entities/user_acess.dart';
import 'package:dentistry/modules/user/infra/models/person_model.dart';

class AppointmentModel extends ManagedObject<_AppointmentModel> implements _AppointmentModel {}

@Table(name: 'appointment')
class _AppointmentModel {

  @Column(primaryKey: true, autoincrement: true)
  int id;



  @Column(indexed: true)
  DateTime date;







}
