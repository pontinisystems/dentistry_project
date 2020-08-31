import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:dentistry/core/utils/jwt_utils.dart';
import 'package:dentistry/modules/user/domain/usecases/find_user_access.dart';
import 'package:injectable/injectable.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

@LazySingleton()
class JWTAuthenticationController extends Controller {


  JWTAuthenticationController(this._useCase);

  final FindUserAccess _useCase;


  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    print('object${request.raw.headers['authorization']}');

    final authHeader = request.raw.headers['authorization'];

    if (authHeader == null || authHeader.isEmpty) {
      return Response.unauthorized();
    }

    final authHeaderContent = authHeader[0]?.split(" ");

    if (authHeaderContent.length != 2 || authHeaderContent[0] != 'Bearer') {
      return Response.badRequest(body: {'message': 'token inválido'});
    }

    try {
      final token = authHeaderContent[1];
      final JwtClaim claimSet =JwtUtils.checkToken(token);
      final userId = int.parse(claimSet.toJson()['sub'].toString());

      if(userId==null){
        throw JwtException;
      }

      final  dateNow = DateTime.now().toUtc();
      if(dateNow.isAfter(claimSet.expiry)){
        return Response.unauthorized(); // Alterinativa é dar um refresh ......
      }
      final   result = await _useCase(userId);

      return result.fold((failure) {
        return Response.unauthorized();
      }, (user) {
        request.attachments['userAccess']=user;
        return request;
      });
    } on JwtException catch (e) {
      print(e);
      return Response.unauthorized();
    }

  }
}