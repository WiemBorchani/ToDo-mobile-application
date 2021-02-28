import 'package:flutter/material.dart';
import 'package:todoapp/widget/AddTodoDialogWidgets.dart';
import 'package:todoapp/widget/main.dart';
import 'package:todoapp/widget/TodoListWidget.dart';
import 'package:todoapp/widget/CompletedListWidget.dart';
import 'package:todoapp/widget/ChangeThemeButtonWidget.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.yellow[800].withOpacity(0.7),
        selectedItemColor: Colors.yellow[800],
        currentIndex: selectIndex,
        onTap: (index) => setState(() {
          selectIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'TODOs'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 28,
              ),
              label: "Completed"),
        ],
      ),
      body: tabs[selectIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.blue[400],
        onPressed: () => showDialog(
          context: context,
          child: AddTodoDialogWidgets(),
          barrierDismissible: true,
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
