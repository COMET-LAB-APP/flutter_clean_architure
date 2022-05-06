import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architure/core/constants/enum/data_source_state.dart';
import 'package:flutter_clean_architure/core/constants/label.dart';
import 'package:flutter_clean_architure/core/util/app_navigator.dart';
import 'package:flutter_clean_architure/core/configuration/router/router.dart';
import 'package:flutter_clean_architure/features/todo/domain/entity/todo.dart';
import 'package:flutter_clean_architure/features/todo/presentation/cubit/todo/todo_cubit.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.dataStatus == DataStatus.failure && state.error != null) {
            return Center(
              child: Text(state.error ?? Label.unKnown),
            );
          }
          if (state.dataStatus == DataStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.dataStatus == DataStatus.success) {
            if (state.todoList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(Label.listTodoEmpty),
                    ElevatedButton(
                      onPressed: () async {
                        await context.read<TodoCubit>().fetchTodoList();
                      },
                      child: const Icon(Icons.refresh),
                    )
                  ],
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<TodoCubit>().fetchTodoList();
              },
              child: ListView.separated(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  Todo todo = state.todoList[index];
                  return ListTile(
                    title: Text(todo.title ?? Label.unKnown),
                    subtitle: Text(todo.userId.toString()),
                    trailing: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color:
                            todo.completed == true ? Colors.blue : Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    onTap: () {
                      AppNavigator.navigateTo(AppRoute.detailRoute,
                          params: todo);
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            );
          } else {
            return Center(
              child: Text(state.error ?? Label.somethingWrong),
            );
          }
        },
      ),
    );
  }
}
