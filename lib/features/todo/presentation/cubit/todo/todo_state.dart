part of 'todo_cubit.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    @Default([]) List<Todo> todoList,
    @Default(DataStatus.initial) DataStatus dataStatus,
    String? error,
  }) = _TodoState;
}
