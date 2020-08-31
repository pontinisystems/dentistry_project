import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/core/model/message.dart';
import 'package:dentistry/core/utils/cryptography_util.dart';
import 'package:dentistry/core/utils/jwt_utils.dart';
import 'package:dentistry/core/utils/strings.dart';
import 'package:dentistry/modules/user/domain/errors/erros.dart';
import 'package:dentistry/modules/user/domain/usecases/login_with_mail_and_password.dart';
import 'package:dentistry/modules/user/presentation/model/login_request.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CheckLoginAndPasswordController extends ResourceController {
  CheckLoginAndPasswordController(this._useCase);

  final LoginWithMailAndPassword _useCase;

  @Operation.post()
  Future<Response> checkLogin(@Bind.body() LoginRequest requestLogin) async {
    final login = requestLogin.login;
    final password = Cryptography.encryptPassword(requestLogin.password);

    final result = await _useCase(login, password);
    return result.fold((failure) {
      if(failure is EmptyLoginOrPassword){
        return Response.badRequest(
            body: Message(
                action: false,
                userMessage: unexpectedFailure,
                technicalMessage: failure.message)
                .toMap());
      }
      if(failure is EntityNotFound){
        return Response.unauthorized();
      }

      return Response.serverError(
          body: Message(
              action: false,
              userMessage: unexpectedFailure,
              technicalMessage: serverError + failure.toString())
              .toMap());
    }, (user) {
      return Response.ok({"token": JwtUtils.generateTokenJWT(user)});
    });
  }










}
