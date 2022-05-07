import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AppInterceptors extends Interceptor {
  final Logger logger;

  AppInterceptors(this.logger);
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    logger.e(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    logger.d(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    logger.d(response);
  }
}
