import 'package:flutter/material.dart';
import '../models/todo_item.dart';

class TodoListTile extends StatelessWidget {
  final TodoItem todo;
  final Function onToggle;
  final Function onDelete;

  TodoListTile({required this.todo, required this.onToggle, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(todo.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.green,
            ),
            onPressed: () => onToggle(),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => onDelete(),
          ),
        ],
      ),
    );
  }
}
