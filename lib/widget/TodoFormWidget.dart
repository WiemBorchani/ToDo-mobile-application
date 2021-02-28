import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangeTitle;
  final ValueChanged<String> onChangeDescription;
  final VoidCallback onSaveTodo;

  const TodoFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    this.onChangeTitle,
    this.onChangeDescription,
    this.onSaveTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(context),
            SizedBox(height: 5),
            buildDescription(context),
            SizedBox(
              height: 16,
            ),
            buildButton(context),
          ],
        ),
      );
  Widget buildTitle(BuildContext context) => TextFormField(
        style: TextStyle(color: Colors.grey),
        cursorColor: Colors.blue[200],
        maxLines: 1,
        initialValue: title,
        onChanged: onChangeTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'Title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Title',
          labelStyle:
              TextStyle(color: Colors.blue[400], fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[400],
              width: 2.0,
            ),
          ),
        ),
      );

  Widget buildDescription(BuildContext context) => TextFormField(
        style: TextStyle(color: Colors.grey),
        cursorColor: Colors.blue[200],
        maxLines: 5,
        initialValue: description,
        onChanged: onChangeDescription,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Description',
          labelStyle:
              TextStyle(color: Colors.blue[400], fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[400],
              width: 2.0,
            ),
          ),
        ),
      );

  Widget buildButton(BuildContext context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
          ),
          onPressed: onSaveTodo,
          child: Text(
            'save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
