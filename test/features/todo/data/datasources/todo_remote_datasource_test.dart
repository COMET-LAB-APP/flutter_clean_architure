import 'package:flutter_clean_architure/core/constants/label.dart';
import 'package:flutter_clean_architure/core/error/exceptions.dart';
import 'package:flutter_clean_architure/core/services/network_call.dart';
import 'package:flutter_clean_architure/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_remote_datasource_test.mocks.dart';

@GenerateMocks([RestClient])
void main() {
  late MockRestClient mockRestClient;
  late TodoRemoteDatasourceImpl todoRemoteDatasourceImpl;
  setUp(() {
    mockRestClient = MockRestClient();
    todoRemoteDatasourceImpl =
        TodoRemoteDatasourceImpl(restClient: mockRestClient);
  });

  group("Get todo from api", () {
    test("Can get todo list", () async {
      when(mockRestClient.getTodos())
          .thenAnswer((realInvocation) => Future.value([]));
      final actual = await todoRemoteDatasourceImpl.getTodos();
      expect(actual, []);
    });

    test("Cannot get todo list", () async {
      when(mockRestClient.getTodos())
          .thenThrow(Exception(Label.somethingWrong));
      final actual = todoRemoteDatasourceImpl.getTodos;
      expect(() => actual(), throwsA(isA<ServerException>()));
    });
  });
}
