import 'package:flutter_clean_architure/core/error/exceptions.dart';
import 'package:flutter_clean_architure/core/services/network_call.dart';
import 'package:flutter_clean_architure/features/todo/data/model/todo_model.dart';
import 'package:injectable/injectable.dart';

/*
Remote datasource is the layer for getting data from outside like API, sdk, etc...
and it's also get error data from outside too.
Note: Datasource should return Model not Entity
*/


//An Abstract class in Dart is defined for those classes which contain one or more than one abstract method (methods without implementation) in them.
abstract class TodoRemoteDatasource {
  Future<List<TodoModel>> getTodos();
}

//Lazy singleton is the type to register class in injectable
@LazySingleton(as: TodoRemoteDatasource)
class TodoRemoteDatasourceImpl extends TodoRemoteDatasource {
  // this is the way to inject the object into class
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
