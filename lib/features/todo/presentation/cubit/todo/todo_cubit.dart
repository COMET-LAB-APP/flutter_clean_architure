import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architure/core/constants/enum/data_source_state.dart';
import 'package:flutter_clean_architure/core/usecases/no_params.dart';
import 'package:flutter_clean_architure/features/todo/domain/entity/todo.dart';
import 'package:flutter_clean_architure/features/todo/domain/usecases/get_todos.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'todo_state.dart';
part 'todo_cubit.freezed.dart';

@injectable
class TodoCubit extends Cubit<TodoState> {
  final GetTodo getTodo;
  TodoCubit(this.getTodo) : super(const TodoState());
  Future<void> fetchTodoList() async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    final req = await getTodo(NoParams());
    req.fold(
        (error) => emit(
            state.copyWith(dataStatus: DataStatus.failure, error: error.msg)),
        (todoList) => emit(state.copyWith(
            dataStatus: DataStatus.success, todoList: todoList)));
  }
}
