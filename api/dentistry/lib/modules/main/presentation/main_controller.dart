import 'package:aqueduct/aqueduct.dart';
import 'file:///C:/workspace/dentistry_project/api/dentistry/lib/modules/main/presentation/model/config.dart';
import 'package:dentistry/modules/main/domain/usecases/populate_data.dart';
import 'file:///C:/workspace/dentistry_project/api/dentistry/lib/modules/main/domain/usecases/create_user.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MainController extends ResourceController {
  MainController(this._useCase,);

  final PopulateData _useCase;



  @Operation.post()
  Future<Response> configure(@Bind.body() Config config ) async {

    final result = await _useCase(config);


  }










}
