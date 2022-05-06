import 'package:flutter_clean_architure/core/constants/local_path.dart';
import 'package:flutter_clean_architure/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:flutter_clean_architure/features/todo/data/model/todo_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'todo_local_datasource_test.mocks.dart';

@GenerateMocks([
  SharedPreferences,
])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late TodoLocalDatasourceImpl todoLocalDatasourceImpl;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    todoLocalDatasourceImpl =
        TodoLocalDatasourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group("Get todo from local database", () {
    test("Can get todo list", () {
      when(mockSharedPreferences.getString(LocalPath.todos))
          .thenAnswer((realInvocation) => null);
      List<TodoModel> actual = todoLocalDatasourceImpl.getTodoLocal();
      expect(actual, []);
    });
  });

  group("Save todo to local database", () {
    test("Can save todo list", () async {
      when(mockSharedPreferences.setString(LocalPath.todos, any))
          .thenAnswer((realInvocation) => Future.value(true));
      bool actual = await todoLocalDatasourceImpl.saveTodo([]);
      expect(actual, true);
    });
  });
}
