import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/modules/user/domain/entities/user_acess.dart';
import 'package:dentistry/modules/user/infra/models/person_model.dart';

class UserAccessModel extends ManagedObject<_UserAccessModel> implements _UserAccessModel {}

@Table(name: 'user_access')
class _UserAccessModel extends UserAccess {

  @override
  @Column(primaryKey: true, autoincrement: true)
  int id;


  @Relate(#userAccess)
  PersonModel people;


}
