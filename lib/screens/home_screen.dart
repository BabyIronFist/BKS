import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/todo_item.dart';
import '../services/todo_service.dart';
import '../widgets/todo_list_tile.dart';
import '../widgets/bottom_nav_bar.dart';
import 'user_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoService _todoService = TodoService();
  int _selectedIndex = 0;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addTodoItem() {
    final String title = _titleController.text;
    final String description = _descriptionController.text;

    if (title.isNotEmpty) {
      final todo = TodoItem(
        id: Uuid().v4(),
        title: title,
        description: description,
      );
      setState(() {
        _todoService.addTodoItem(todo);
      });
      _titleController.clear();
      _descriptionController.clear();
      Navigator.of(context).pop();
    }
  }

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('添加任务'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: '标题'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: '描述'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            ElevatedButton(
              onPressed: _addTodoItem,
              child: Text('添加'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UserScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final todos = _todoService.getTodos();

    return Scaffold(
      appBar: AppBar(
        title: Text('记事本'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return TodoListTile(
            todo: todo,
            onToggle: () {
              setState(() {
                _todoService.toggleTodoStatus(todo.id);
              });
            },
            onDelete: () {
              setState(() {
                _todoService.removeTodoItem(todo.id);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
