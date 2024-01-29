import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param parameters);
}
