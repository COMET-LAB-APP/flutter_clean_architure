import 'package:flutter_clean_architure/core/constants/api_path.dart';
import 'package:flutter_clean_architure/features/todo/data/model/todo_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'network_call.g.dart';

@RestApi(baseUrl: ApiPath.baseUrl)
@singleton
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio) = _RestClient;

  @GET(ApiPath.getTodo)
  Future<List<TodoModel>> getTodos();
}
