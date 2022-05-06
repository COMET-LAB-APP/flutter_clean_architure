import 'package:flutter_clean_architure/core/error/exceptions.dart';
import 'package:flutter_clean_architure/core/services/network_call.dart';
import 'package:flutter_clean_architure/features/todo/data/model/todo_model.dart';
import 'package:injectable/injectable.dart';

abstract class TodoRemoteDatasource {
  Future<List<TodoModel>> getTodos();
}

@LazySingleton(as: TodoRemoteDatasource)
class TodoRemoteDatasourceImpl extends TodoRemoteDatasource {
  final RestClient restClient;
  TodoRemoteDatasourceImpl({
    required this.restClient,
  });

  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await restClient.getTodos();
      return response;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
