


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class UseCase<T, Params> {
  const UseCase();

  Future<Either<Failure, T>> call(Params params);
}


class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}