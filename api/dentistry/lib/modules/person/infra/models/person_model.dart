import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/modules/address/infra/models/address_model.dart';
import 'package:dentistry/modules/person/domain/entities/person.dart';

class PersonModel extends ManagedObject<_PersonModel>
    implements _PersonModel {}

@Table(name: 'person')
class _PersonModel extends Person {
  @override
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(
    #address,
    isRequired: false,
    onDelete: DeleteRule.cascade,
  )
  AddressModel address;

  PersonModel person;
}
