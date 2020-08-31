import 'package:aqueduct/aqueduct.dart';

class AppointmentModel extends ManagedObject<_AppointmentModel> implements _AppointmentModel {}

@Table(name: 'appointment')
class _AppointmentModel {

  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column(indexed: true)
  DateTime date;







}
