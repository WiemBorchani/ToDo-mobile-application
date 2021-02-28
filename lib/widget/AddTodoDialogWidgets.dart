import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/widget/TodoFormWidget.dart';

class AddTodoDialogWidgets extends StatefulWidget {
  @override
  _AddTodoDialogWidgets createState() => _AddTodoDialogWidgets();
}

class _AddTodoDialogWidgets extends State<AddTodoDialogWidgets> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add your TODO',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  color: Colors.yellow[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TodoFormWidget(
                onChangeTitle: (title) => setState(() => this.title = title),
                onChangeDescription: (description) =>
                    setState(() => this.description = description),
                onSaveTodo: addTodo,
              ),
            ],
          ),
        ),
      );

  void addTodo() {
    final isValid = _formkey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );
      final provider = Provider.of<ToDoProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}
