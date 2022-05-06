import 'package:dio/dio.dart';
import 'package:flutter_clean_architure/core/services/app_interceptors.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectionModule {
//injecting third party libraries
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  Logger get logger => Logger();
  Dio get dio => Dio()..interceptors.add(AppInterceptors(logger));
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
}
