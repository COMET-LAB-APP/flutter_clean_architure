import 'package:equatable/equatable.dart';

/* entity is layer that get the perfect information from datasource layer.
Note: equatable is package for making dart can compare objects.
*/
class Todo extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  const Todo({this.id, this.userId, this.title, this.completed});

  @override
  List<Object?> get props => [userId, id, title, completed];
}
