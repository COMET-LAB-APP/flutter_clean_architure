import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architure/core/configuration/DI/service_locator.dart';
import 'package:flutter_clean_architure/core/constants/label.dart';
import 'package:flutter_clean_architure/core/widgets/not_found.dart';
import 'package:flutter_clean_architure/features/todo/domain/entity/todo.dart';
import 'package:flutter_clean_architure/features/todo/presentation/cubit/todo/todo_cubit.dart';
import 'package:flutter_clean_architure/features/todo/presentation/pages/todo_detail_page.dart';
import 'package:flutter_clean_architure/features/todo/presentation/pages/todo_page.dart';

class AppRoute {
  static const String homeRoute = "/";
  static const String detailRoute = "/detail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _materialRoute(
          const TodoPage(title: Label.titleApp),
          providers: [
            BlocProvider<TodoCubit>(
              create: (context) => getIt<TodoCubit>()..fetchTodoList(),
            ),
          ],
        );
      case detailRoute:
        Todo todo = settings.arguments as Todo;
        return _materialRoute(TodoDetailPage(
          todo: todo,
        ));
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget screen,
      {List<BlocProvider> providers = const []}) {
    return MaterialPageRoute(
        builder: (context) => providers.isNotEmpty
            ? MultiBlocProvider(providers: providers, child: screen)
            : screen);
  }
}
