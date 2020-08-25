import 'package:dentistry/modules/user/domain/entities/user_acess.dart';

class Person {

  const Person({
    this.id,
    this.name,
    this.dateOfBirth,
    this.userAccess,

  });


  final int id;
  final String name;
  final DateTime dateOfBirth;
  final UserAccess userAccess;


}
