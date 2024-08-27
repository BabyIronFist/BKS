import 'package:hive/hive.dart';
import '../models/todo_item.dart';

class TodoService {
  final Box<TodoItem> _todoBox = Hive.box<TodoItem>('todoBox');

  List<TodoItem> getTodos() {
    return _todoBox.values.toList();
  }

  void addTodoItem(TodoItem item) {
    _todoBox.put(item.id, item);
  }

  void toggleTodoStatus(String id) {
    final todo = _todoBox.get(id);
    if (todo != null) {
      todo.isCompleted = !todo.isCompleted;
      todo.save();
    }
  }

  void removeTodoItem(String id) {
    _todoBox.delete(id);
  }
}
