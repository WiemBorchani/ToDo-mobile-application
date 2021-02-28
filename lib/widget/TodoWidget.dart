import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/Utils.dart';
import 'package:todoapp/page/EditTodoPage.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({
    this.todo,
    Key key,
  }) : super(key: key);
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(todo.id),
        actions: [
          IconSlideAction(
            color: Colors.green[700],
            onTap: () => editTodo(context, todo),
            caption: 'Edit',
            icon: Icons.edit,
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red[800],
            onTap: () => deleteTodo(context, todo),
            caption: 'Delete',
            icon: Icons.delete,
          )
        ],
        child: buildTodo(context),
      ));
  Widget buildTodo(BuildContext context) => GestureDetector(
      onTap: () => editTodo(context, todo),
      child: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.yellow[800],
                checkColor: Theme.of(context).primaryColor,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<ToDoProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);
                  Utils.showSnackBar(
                    context,
                    isDone ? 'Task completed' : 'task marked incompleted',
                  );
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 22,
                    ),
                  ),
                  if (todo.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(todo.description,
                          style: TextStyle(
                              color: Theme.of(context).unselectedWidgetColor,
                              fontSize: 20,
                              height: 1.5)),
                    )
                ],
              ))
            ],
          )));
  void deleteTodo(context, todo) {
    final provider = Provider.of<ToDoProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, "Deleted the task");
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
