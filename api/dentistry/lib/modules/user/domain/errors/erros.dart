
import 'package:dentistry/core/exception/exceptions.dart';

class InvalidSearchText extends Failure {

  InvalidSearchText(String message) : super(message);
}

class EmptyList extends Failure {
  EmptyList(String message) : super(message);
}

class ErrorSearch extends Failure {
  ErrorSearch(String message) : super(message);
}

class DatasourceResultNull extends Failure {
  DatasourceResultNull(String message) : super(message);
}

class EmptyLoginOrPassword extends Failure {
  EmptyLoginOrPassword(String message) : super(message);
}


class UserNotFound extends Failure {
  UserNotFound(String message) : super(message);
}

class EntityNotFound extends Failure {
  EntityNotFound(String message) : super(message);
}
