import 'package:dentistry/modules/appointment/presentation/controllers/statistic_controller.dart';
import 'package:dentistry/modules/main/presentation/main_controller.dart';
import 'package:dentistry/modules/user/presentation/controllers/check_login_and_password_controller.dart';
import 'package:get_it/get_it.dart';

import 'core/dependency_injection/dependency_injection_conf.dart';
import 'core/presentation/jwt_authentication_controller.dart';
import 'dentistry.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class DentistryChannel extends ApplicationChannel {
  ManagedContext context;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = DentistryConfiguration(options.configurationFilePath);
    context = contextWithConnectionInfo(config.database);
    GetIt.I.registerFactory(() => context);
    configureDependencies();
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();
    //UserRouter.configure(router, context);

    router
        .route('main')
        .link(() => GetIt.instance.get<MainController>());


    router
        .route('user/v1/user/profile')
        .link(() => GetIt.instance.get<JWTAuthenticationController>())
        .link(() => GetIt.instance.get<CheckLoginAndPasswordController>());


    router
        .route('appointment/v1/statistic')
        .link(() => GetIt.instance.get<JWTAuthenticationController>())
        .link(() => GetIt.instance.get<StatisticAppointmentController>());

    router
        .route('user/v1/login')
        .link(() => GetIt.instance.get<CheckLoginAndPasswordController>());

    router
        .route('user/v1/register')
        .link(() => GetIt.instance.get<JWTAuthenticationController>())
        .link(() => GetIt.instance.get<CheckLoginAndPasswordController>());









    return router;
  }

  /*
   * Helper methods
   */

  ManagedContext contextWithConnectionInfo(
      DatabaseConfiguration connectionInfo) {
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore(
        connectionInfo.username,
        connectionInfo.password,
        connectionInfo.host,
        connectionInfo.port,
        connectionInfo.databaseName);

    return ManagedContext(dataModel, psc);
  }
}

/// An instance of this class reads values from a configuration
/// file specific to this application.
///
/// Configuration files must have key-value for the properties in this class.
/// For more documentation on configuration files, see https://aqueduct.io/docs/configure/ and
/// https://pub.dartlang.org/packages/safe_config.
class DentistryConfiguration extends Configuration {
  DentistryConfiguration(String fileName) : super.fromFile(File(fileName));

  DatabaseConfiguration database;
}
