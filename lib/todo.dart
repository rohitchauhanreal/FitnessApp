import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Todo {
  final String title;
  bool completed;

  Todo({
    required this.title,
    this.completed = false,
  });
}

class TodoListApp extends StatefulWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  final List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _loadData(); // Load data when the app starts
  }

  void _addTodo() {
    showDialog(
      context: context,
      builder: (context) {
        String newTodoTitle = '';

        return AlertDialog(
          title: const Text('Add To-do'),
          content: TextField(
            onChanged: (value) {
              newTodoTitle = value;
            },
          ),
          actions: [
            ElevatedButton(

              onPressed: () {
                setState(() {
                  _todos.add(Todo(title: newTodoTitle));
                });
                Navigator.pop(context);
                _saveData(); // Save data after adding a todo
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _toggleTodoCompleted(int index) {
    setState(() {
      _todos[index].completed = !_todos[index].completed;
    });
    _saveData(); // Save data after toggling completion
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? todoTitles = prefs.getStringList('todos');

    if (todoTitles != null) {
      setState(() {
        _todos.clear();
        _todos.addAll(todoTitles.map((title) => Todo(title: title)));
      });
    }
  }

  @override
  void dispose() {
    _saveData(); // Save data when the app is closed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        backgroundColor: const Color(0xFFA286F1),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];

          return ListTile(
            title: Text(
              todo.title,
              style: TextStyle(
                decoration: todo.completed ? TextDecoration.lineThrough : null,
              ),
            ),
            leading: Checkbox(
              value: todo.completed,
              onChanged: (_) => _toggleTodoCompleted(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFA286F1),
        onPressed: _addTodo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _saveData() async {
    final todos = _todos;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('todos', todos.map((todo) => todo.title).toList());
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TodoListApp(),
  ));
}
