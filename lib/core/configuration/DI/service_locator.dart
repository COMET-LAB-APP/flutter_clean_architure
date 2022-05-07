import 'package:flutter/material.dart';
import 'package:flutter_clean_architure/core/configuration/DI/service_locator.config.dart';
import 'package:flutter_clean_architure/core/util/app_navigator.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

//This path is registering of services and also the modules
@injectableInit
Future<void> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize navigator
  AppNavigator();
  //initialize dependencies
  await $initGetIt(getIt);
}
