class Failure implements Exception {
  Failure(this.message){
    print("============  Log Excpetion============  ");
    print(message);
    print("============= Fim Log Excpetion============  ");
  }

  final String message;
}

class DatabaseException implements Failure {

  DatabaseException(this.message);

  @override
  final String message;

  @override
  String toString() => 'DatabaseException(message: $message)';
}
class UnexpectedError implements Failure {

  UnexpectedError(this.message);

  @override
  final String message;

  @override
  String toString() => 'UnexpectedError(message: $message)';
}





class InvalidDate extends Failure {

  InvalidDate(String message) : super(message);
}
