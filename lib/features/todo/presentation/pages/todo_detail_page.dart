import 'package:flutter/material.dart';
import 'package:flutter_clean_architure/core/constants/label.dart';
import 'package:flutter_clean_architure/features/todo/domain/entity/todo.dart';

class TodoDetailPage extends StatelessWidget {
  final Todo todo;
  const TodoDetailPage({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Label.detailTitle),
      ),
      body: Card(
        child: ListTile(
          title: Text(
            todo.title ?? Label.unKnown,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            "${Label.user}: ${todo.userId}",
          ),
          trailing: Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: todo.completed == true ? Colors.blue : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
