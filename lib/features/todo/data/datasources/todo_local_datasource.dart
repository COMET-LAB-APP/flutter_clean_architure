import 'dart:convert';

import 'package:flutter_clean_architure/core/constants/label.dart';
import 'package:flutter_clean_architure/core/constants/local_path.dart';
import 'package:flutter_clean_architure/core/error/exceptions.dart';
import 'package:flutter_clean_architure/features/todo/data/model/todo_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
Local datasource is the layer for getting data from cached like share preference, local database, etc...
and it's also get error data when data to convert is invalid and also when local database has something wrong.
*/

abstract class TodoLocalDatasource {
  List<TodoModel> getTodoLocal();
  Future<bool> saveTodo(List<TodoModel> data);
}

@LazySingleton(as: TodoLocalDatasource)
class TodoLocalDatasourceImpl extends TodoLocalDatasource {
  final SharedPreferences sharedPreferences;
  TodoLocalDatasourceImpl({
    required this.sharedPreferences,
  });

  @override
  List<TodoModel> getTodoLocal() {
    final String? raw = sharedPreferences.getString(LocalPath.todos);
    List<dynamic> convertData = raw == null ? [] : json.decode(raw);
    List<TodoModel> response = [];
    for (var json in convertData) {
      response.add(TodoModel.fromJson(json));
    }
    return response;
  }

  @override
  Future<bool> saveTodo(List<TodoModel> data) async {
    final String raw = json.encode(data);
    return await sharedPreferences.setString(LocalPath.todos, raw);
  }
}
