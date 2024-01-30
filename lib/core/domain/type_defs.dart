import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
typedef FutureVoid = Future<void>;
