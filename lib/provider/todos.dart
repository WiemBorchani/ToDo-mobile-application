import 'package:flutter/foundation.dart';
import 'package:todoapp/model/todo.dart';

class ToDoProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "Send email",
    ),
    Todo(
        createdTime: DateTime.now(),
        title: "Take a rest",
        description: "-Have coffee"),
    Todo(
        createdTime: DateTime.now(),
        title: "Movie night",
        description: "-Get out"),
    Todo(
        createdTime: DateTime.now(),
        title: "Read a book",
        description: "-Zola"),
    Todo(createdTime: DateTime.now(), title: "Sleep", description: ""),
    Todo(createdTime: DateTime.now(), title: "Call lou", description: "-8 am"),
  ];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompletetd =>
      _todos.where((todo) => todo.isDone == true).toList();
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
