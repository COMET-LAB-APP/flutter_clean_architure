import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architure/core/error/exceptions.dart';
import 'package:flutter_clean_architure/core/error/failures.dart';
import 'package:flutter_clean_architure/core/services/network_info.dart';
import 'package:flutter_clean_architure/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:flutter_clean_architure/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:flutter_clean_architure/features/todo/domain/entity/todo.dart';
import 'package:flutter_clean_architure/features/todo/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl extends TodoRepository {
  final NetworkInfo networkInfo;
  final TodoRemoteDatasource homeRemoteDatasource;
  final TodoLocalDatasource homeLocalDatasource;
  TodoRepositoryImpl({
    required this.networkInfo,
    required this.homeRemoteDatasource,
    required this.homeLocalDatasource,
  });

  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    try {
      if (await networkInfo.isConnected) {
        final listTodos = await homeRemoteDatasource.getTodos();
        await homeLocalDatasource.saveTodo(listTodos);
        return Right(listTodos);
      } else {
        return Right(homeLocalDatasource.getTodoLocal());
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }
}
