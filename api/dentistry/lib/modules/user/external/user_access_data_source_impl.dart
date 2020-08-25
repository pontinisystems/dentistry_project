import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/core/exception/exceptions.dart';
import 'package:dentistry/modules/user/infra/datasources/user_access_data_source.dart';
import 'package:dentistry/modules/user/infra/models/person_model.dart';
import 'package:dentistry/modules/user/infra/models/user_access_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserAccessDataSource)
class UserAccessDataSourceImpl implements UserAccessDataSource {
  UserAccessDataSourceImpl(this.context);

  final ManagedContext context;

  @override
  Future<UserAccessModel> findUserAccessById(int id) async {
    try {
      final query = Query<UserAccessModel>(context)
        ..where((userAccess) => userAccess.id).equalTo(id);
      final user = await query.fetchOne();
      return user;
    } catch (e, s) {
      throw DatabaseException('Ocorreu um erro ao recuperar o usuário');
    }
  }

  
  @override
  Future<UserAccessModel> recoverUserByLoginPassword(
      String login, String password) async {
    try {
      final query = Query<UserAccessModel>(context)
        ..where((userAccess) => userAccess.login).equalTo(login.trim())
        ..where((userAccess) => userAccess.password).equalTo(password.trim());
      final user = await query.fetchOne();
      return user;
    } catch (e, s) {
      throw DatabaseException('Ocorreu um erro ao recuperar o usuário');
    }
  }

  @override
  Future<PersonModel> getMyInfo() async{
    try {
      final query = Query<PersonModel>(context)
        ..where((people) => people.id).equalTo(1);
      final person = await query.fetchOne();
      return person;
    } catch (e, s) {
      throw DatabaseException('Ocorreu um erro ao recuperar as informações do usuário');
    }
  }
}
