// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../../features/todo/data/datasources/todo_local_datasource.dart'
    as _i9;
import '../../../features/todo/data/datasources/todo_remote_datasource.dart'
    as _i10;
import '../../../features/todo/data/repositories/todo_repository_impl.dart'
    as _i12;
import '../../../features/todo/domain/repositories/todo_repository.dart'
    as _i11;
import '../../../features/todo/domain/usecases/get_todos.dart' as _i13;
import '../../../features/todo/presentation/cubit/todo/todo_cubit.dart' as _i14;
import '../../services/network_call.dart' as _i7;
import '../../services/network_info.dart' as _i6;
import 'register_modules.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  gh.factory<_i3.Dio>(() => injectionModule.dio);
  gh.factory<_i4.InternetConnectionChecker>(
      () => injectionModule.internetConnectionChecker);
  gh.factory<_i5.Logger>(() => injectionModule.logger);
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.singleton<_i7.RestClient>(_i7.RestClient(get<_i3.Dio>()));
  await gh.factoryAsync<_i8.SharedPreferences>(() => injectionModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i9.TodoLocalDatasource>(() => _i9.TodoLocalDatasourceImpl(
      sharedPreferences: get<_i8.SharedPreferences>()));
  gh.lazySingleton<_i10.TodoRemoteDatasource>(
      () => _i10.TodoRemoteDatasourceImpl(restClient: get<_i7.RestClient>()));
  gh.lazySingleton<_i11.TodoRepository>(() => _i12.TodoRepositoryImpl(
      networkInfo: get<_i6.NetworkInfo>(),
      homeRemoteDatasource: get<_i10.TodoRemoteDatasource>(),
      homeLocalDatasource: get<_i9.TodoLocalDatasource>()));
  gh.lazySingleton<_i13.GetTodo>(
      () => _i13.GetTodo(get<_i11.TodoRepository>()));
  gh.factory<_i14.TodoCubit>(() => _i14.TodoCubit(get<_i13.GetTodo>()));
  return get;
}

class _$InjectionModule extends _i15.InjectionModule {}
