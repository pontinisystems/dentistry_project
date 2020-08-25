import 'package:dartz/dartz.dart';
import 'package:dentistry/core/exception/exceptions.dart';

abstract class FilterRangeBase{

  FilterRangeBase( this.initDate,this.finalDate);

  final DateTime initDate;
  final DateTime finalDate;

  Either<Failure, bool>  validate(){
    if(initDate==null){
      return left(InvalidDate("A data inicial está incorreta"));
    }
    if(finalDate==null){
      return left(InvalidDate("A data final está incorreta"));
    }
    if(initDate.isAfter(finalDate)){
      return left(InvalidDate("A data inicial não pode ser depois da data final"));

    }
    return right(true);

  }

}