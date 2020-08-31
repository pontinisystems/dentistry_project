import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/modules/address/domain/entities/address.dart';

class AddressModel extends ManagedObject<_AddressModel>
    implements _AddressModel {}

@Table(name: 'address')
class _AddressModel extends Address{

  @override
  @Column(primaryKey: true, autoincrement: true)
  int id;



  AddressModel address;

}