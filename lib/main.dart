import 'package:flutter/material.dart';
import 'package:flutter_clean_architure/core/configuration/DI/service_locator.dart';
import 'package:flutter_clean_architure/core/constants/label.dart';
import 'package:flutter_clean_architure/core/util/app_navigator.dart';
import 'package:flutter_clean_architure/core/configuration/router/router.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Label.titleApp,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoute.homeRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
