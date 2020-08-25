

import 'package:dentistry/modules/user/infra/models/person_model.dart';
import 'package:dentistry/modules/user/infra/models/user_access_model.dart';

abstract class UserAccessDataSource{
  Future<UserAccessModel> recoverUserByLoginPassword(String login , String password);
  Future<UserAccessModel> findUserAccessById(int id);
  Future<PersonModel> getMyInfo();

}

