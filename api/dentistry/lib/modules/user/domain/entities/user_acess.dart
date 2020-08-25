
import 'package:dentistry/modules/person/domain/entities/person.dart';

class UserAccess {

  const UserAccess( {
    this.id,
    this.login,
    this.password,
    this.person,
  });


  final int id;
  final String login;
  final String password;
  final Person person;


}
