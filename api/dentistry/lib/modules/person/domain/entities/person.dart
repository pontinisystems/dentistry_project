import 'package:dentistry/modules/user/domain/entities/user_acess.dart';

class Person {
  const Person({
    this.id,
    this.name,
    this.email,
    this.dateOfBirth,
    this.userAccess,
    this.gender,
  });

  final int id;
  final String name;
  final String email;
  final DateTime dateOfBirth;
  final UserAccess userAccess;
  final SelectGender gender;
}

enum SelectGender { Male, Female }
