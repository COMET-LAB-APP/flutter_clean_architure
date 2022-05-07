import 'package:flutter_clean_architure/features/todo/domain/entity/todo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'todo_model.g.dart';


/*
The purpose of the layer or model layer is convert raw data from API, sdk, etc...
and then it will set data that was convert to Parent class which is entity.
*/

@JsonSerializable()
class TodoModel extends Todo {
  const TodoModel({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) : 
  // Assign to entity
  super(
          completed: completed,
          id: id,
          title: title,
          userId: userId,
        );
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
