import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architure/core/error/failures.dart';
import 'package:flutter_clean_architure/features/todo/domain/entity/todo.dart';

// In repo domain we gonna define methods that we will create.
abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
}
