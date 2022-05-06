import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architure/core/error/failures.dart';
import 'package:flutter_clean_architure/core/usecases/no_params.dart';
import 'package:flutter_clean_architure/core/usecases/usecase.dart';
import 'package:flutter_clean_architure/features/todo/domain/entity/todo.dart';
import 'package:flutter_clean_architure/features/todo/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTodo implements UseCase<List<Todo>, NoParams> {
  final TodoRepository homeRepository;

  GetTodo(this.homeRepository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams noParams) async {
    return await homeRepository.getTodos();
  }
}
