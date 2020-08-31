import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/modules/person/domain/entities/person.dart';
import 'package:dentistry/modules/user/infra/models/user_access_model.dart';

class PersonModel extends ManagedObject<_PersonModel> implements _PersonModel {}

@Table(name: 'person')
class _PersonModel extends Person {

  @override
  @Column(primaryKey: true, autoincrement: true)
  int id;


  @override
  UserAccessModel userAccess;


}
